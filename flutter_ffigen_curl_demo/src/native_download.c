#include "native_download.h"

#include <curl/curl.h>
#include <pthread.h>
#include <stdio.h>
#include <stdatomic.h>
#include <stdlib.h>

struct download_cancel_token {
    // 界面线程写入、下载线程读取，避免普通整数跨线程访问产生数据竞争。
    atomic_int cancelled;
};

download_cancel_token *native_download_cancel_create(void) {
    // 使用堆内存，让标记在整个同步下载期间保持有效。
    download_cancel_token *token = malloc(sizeof(*token));
    if (token) atomic_init(&token->cancelled, 0);
    return token;
}

void native_download_cancel_request(download_cancel_token *token) {
    // 仅设置标记，不在界面线程直接关闭下载句柄或文件。
    if (token) atomic_store(&token->cancelled, 1);
}

void native_download_cancel_destroy(download_cancel_token *token) {
    // 调用方需等待下载结束，防止回调访问已释放内存。
    free(token);
}

// 确保多个线程调用下载接口时，libcurl 的全局初始化也只执行一次。
static pthread_once_t curl_once = PTHREAD_ONCE_INIT;
// 保存初始化结果，后续调用可直接检查并返回初始化错误。
static CURLcode curl_init_result;

static void init_curl(void) {
    curl_init_result = curl_global_init(CURL_GLOBAL_DEFAULT);
}

// 将 Dart 回调和取消标记一起传给 libcurl 的用户数据参数。
struct download_progress {
    download_progress_callback callback;
    download_cancel_token *cancel_token;
};

// libcurl 在 curl_easy_perform 所在线程调用此函数，返回 0 表示继续下载。
static int report_progress(void *data, curl_off_t total, curl_off_t downloaded,
                           curl_off_t upload_total, curl_off_t uploaded) {
    (void)upload_total;
    (void)uploaded;
    // 本接口只关心下载，忽略 libcurl 提供的上传进度参数。
    struct download_progress *progress = data;
    // 返回非零值让 libcurl 中断传输，并正常执行后续资源清理。
    if (progress->cancel_token && atomic_load(&progress->cancel_token->cancelled)) {
        return 1;
    }
    if (progress->callback) {
        progress->callback((long long)downloaded, (long long)total);
    }
    return 0;
}

int native_download(const char *url, const char *path,
                    download_progress_callback on_progress,
                    download_cancel_token *cancel_token) {
    // 先完成线程安全的全局初始化，失败时不继续创建下载句柄。
    if (pthread_once(&curl_once, init_curl) != 0) {
        return CURLE_FAILED_INIT;
    }
    if (curl_init_result != CURLE_OK) {
        return curl_init_result;
    }

    // 每次下载使用独立的 easy 句柄，并在结束时统一释放。
    CURL *curl = curl_easy_init();
    if (!curl) {
        return CURLE_FAILED_INIT;
    }

    // 以二进制模式写入文件；已有文件会被截断，打开失败时先释放句柄。
    FILE *file = fopen(path, "wb");
    if (!file) {
        curl_easy_cleanup(curl);
        return CURLE_WRITE_ERROR;
    }

    // 将 C 可变参数调用封装在原生层，避免 FFI 调用方直接处理可变参数。
    // 任一选项设置失败都跳转到统一清理位置，并保留原始错误码。
    CURLcode result;
#define SET_OPTION(option, value)                            \
    do {                                                     \
        result = curl_easy_setopt(curl, (option), (value));    \
        if (result != CURLE_OK) goto done;                    \
    } while (0)

    SET_OPTION(CURLOPT_URL, url);
    // 原始请求和重定向都只允许 HTTP、HTTPS 协议。
    SET_OPTION(CURLOPT_PROTOCOLS_STR, "http,https");
    SET_OPTION(CURLOPT_REDIR_PROTOCOLS_STR, "http,https");
    // 自动跟随重定向，最多允许跳转 5 次。
    SET_OPTION(CURLOPT_FOLLOWLOCATION, 1L);
    SET_OPTION(CURLOPT_MAXREDIRS, 5L);
    // 禁用信号，便于在多线程环境中使用。
    SET_OPTION(CURLOPT_NOSIGNAL, 1L);
    // 连接超时为 10 秒，整个传输超时为 60 秒。
    SET_OPTION(CURLOPT_CONNECTTIMEOUT, 10L);
    SET_OPTION(CURLOPT_TIMEOUT, 60L);
    // 将 HTTP 400 及以上的响应视为错误。
    SET_OPTION(CURLOPT_FAILONERROR, 1L);
    // 使用 libcurl 默认写入回调，将响应内容写入目标文件。
    SET_OPTION(CURLOPT_WRITEDATA, (void *)file);

    // 栈上的回调上下文在同步下载结束前始终有效。
    // 即使没有进度监听器，只要支持取消，也需要开启 libcurl 进度回调。
    struct download_progress progress = {on_progress, cancel_token};
    if (on_progress || cancel_token) {
        SET_OPTION(CURLOPT_XFERINFOFUNCTION, report_progress);
        SET_OPTION(CURLOPT_XFERINFODATA, &progress);
        // libcurl 默认关闭进度通知，设置为 0 才会调用 report_progress。
        SET_OPTION(CURLOPT_NOPROGRESS, 0L);
    }

#undef SET_OPTION

    // 同步执行请求；传输成功后再检查最终 HTTP 状态码。
    result = curl_easy_perform(curl);
    if (result == CURLE_OK) {
        long status = 0;
        result = curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &status);
        // 本接口只接受 HTTP 200，其他状态统一返回 HTTP 响应错误。
        if (result == CURLE_OK && status != 200) {
            result = CURLE_HTTP_RETURNED_ERROR;
        }
    }

done:
    // 无论成功或失败都释放资源；失败时可能留下空文件或部分下载内容。
    curl_easy_cleanup(curl);
    // 关闭文件时可能发生缓冲区写入错误，仅在此前成功时覆盖返回结果。
    if (fclose(file) != 0 && result == CURLE_OK) {
        return CURLE_WRITE_ERROR;
    }
    return result;
}

const char *native_download_error(int code) {
    // 返回 libcurl 提供的错误描述，字符串生命周期由 libcurl 管理。
    return curl_easy_strerror((CURLcode)code);
}
