#ifndef NATIVE_DOWNLOAD_H
#define NATIVE_DOWNLOAD_H

// 导出原生接口符号，供 Dart FFI 等外部调用方查找。
#define DOWNLOAD_EXPORT __attribute__((visibility("default")))

// 在执行下载的线程中同步通知进度；total 为 0 时表示总大小未知。
typedef void (*download_progress_callback)(long long downloaded, long long total);

// 跨线程取消标记，由原子操作同步；下载结束后才能释放。
typedef struct download_cancel_token download_cancel_token;
// 创建未取消的标记；分配失败返回 NULL，调用方负责最终释放。
DOWNLOAD_EXPORT download_cancel_token *native_download_cancel_create(void);
// 可从界面线程请求取消；实际中断发生在下一次 libcurl 进度回调中。
DOWNLOAD_EXPORT void native_download_cancel_request(download_cancel_token *token);
// 仅在下载线程不再访问标记后调用，不能与下载或取消请求并发执行。
DOWNLOAD_EXPORT void native_download_cancel_destroy(download_cancel_token *token);

// 同步下载 URL 指向的资源到 path；目标文件会以二进制写入模式创建或覆盖。
// 返回 libcurl 错误码，0 表示成功；仅将 HTTP 200 响应视为下载成功。
// on_progress 和 cancel_token 均可为 NULL；传入的回调与标记须保持有效直到返回。
// 取消时通常返回 CURLE_ABORTED_BY_CALLBACK，未完成文件由上层负责删除。
DOWNLOAD_EXPORT int native_download(const char *url, const char *path,
                                  download_progress_callback on_progress,
                                  download_cancel_token *cancel_token);

// 将错误码转换为错误描述；返回的字符串由 libcurl 管理，调用方无需释放。
DOWNLOAD_EXPORT const char *native_download_error(int code);

#endif
