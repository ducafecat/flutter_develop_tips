import 'dart:io';
import 'dart:isolate';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:flutter_ffigen_curl_demo/native_download.g.dart' as native;

// 项目移动后可通过 --dart-define=PROJECT_DIR=/path/to/project 覆盖下载根目录。
const _projectDirectory = String.fromEnvironment(
  'PROJECT_DIR',
  defaultValue: '/Users/ducafecat/Desktop/flutter_ffigen_curl_demo',
);

// 限制 URL 中可直接用作本地文件名的字符和长度。
final _safeFileName = RegExp(r'^[A-Za-z0-9][A-Za-z0-9._-]{0,120}$');

/// 用户主动取消下载，供界面与普通下载错误分别处理。
class DownloadCancelledException implements Exception {
  const DownloadCancelledException();

  @override
  String toString() => '下载已取消';
}

// 每次下载创建一个 token。只在下载期间持有原生标记，结束后自动释放。
class DownloadCancelToken {
  bool _cancelled = false;
  // 一次性使用，避免多次下载共享同一个原生取消标记。
  bool _used = false;
  // 此指针仅在原生下载期间有效，释放前先清空。
  Pointer<native.download_cancel_token>? _handle;

  bool get isCancelled => _cancelled;

  /// 请求取消；也支持在原生下载启动前调用。
  void cancel() {
    _cancelled = true;
    final handle = _handle;
    if (handle != null) native.native_download_cancel_request(handle);
  }

  void _checkCancelled() {
    if (_cancelled) throw const DownloadCancelledException();
  }
}

/// 下载成功后返回最终文件；失败或取消时清理本次下载的临时目录。
/// [onProgress] 在调用方 Isolate 执行，参数依次为已下载字节数和总字节数。
/// 总大小为 0 时表示未知；[cancelToken] 只能用于本次下载。
Future<File> downloadFile(
  String address, {
  void Function(int downloaded, int total)? onProgress,
  DownloadCancelToken? cancelToken,
}) async {
  final token = cancelToken ?? DownloadCancelToken();
  if (token._used) throw StateError('取消标记不能重复用于下载');
  token._used = true;
  token._checkCancelled();
  // 只接受带主机名且不包含用户名、密码的 HTTP/HTTPS 地址。
  final url = Uri.tryParse(address.trim());
  if (url == null ||
      (url.scheme != 'https' && url.scheme != 'http') ||
      url.host.isEmpty ||
      url.userInfo.isNotEmpty) {
    throw const FormatException('请输入有效的 HTTP 或 HTTPS 下载地址。');
  }

  // 从 URL 提取安全文件名，不符合规则时使用默认名称。
  final segments = url.pathSegments;
  final name = segments.isEmpty ? '' : segments.last;
  final fileName = _safeFileName.hasMatch(name) ? name : 'download.bin';
  final directory = await Directory('$_projectDirectory/tmp')
      .create(recursive: true);
  // 先写入独立目录中的 .part 文件，成功后再改名，避免暴露不完整的目标文件。
  final staging = await directory.createTemp('.download_');
  final outputPath = '${directory.path}/$fileName';
  final partialPath = '${staging.path}/$fileName.part';
  // URL 片段不属于发送给服务器的资源地址。
  final urlString = url.removeFragment().toString();

  // 主 Isolate 接收进度，原生下载仍在工作 Isolate 中执行。
  final progressPort = ReceivePort();
  final subscription = progressPort.listen((message) {
    // 消息只包含整数；页面回调留在主 Isolate，不跨 Isolate 传输。
    final progress = message as List<int>;
    onProgress?.call(progress[0], progress[1]);
  });
  final sendPort = progressPort.sendPort;
  try {
    // 创建临时目录期间可能收到取消请求，因此启动原生下载前再次检查。
    token._checkCancelled();
    final handle = native.native_download_cancel_create();
    if (handle == nullptr) throw StateError('无法创建下载取消标记');
    token._handle = handle;
    try {
      // 以整数地址传递原生标记，底层内存仍由调用方持有。
      await _runDownload(urlString, partialPath, sendPort, handle.address);
    } catch (_) {
      // 若已请求取消，将底层错误转换为专门的取消异常。
      token._checkCancelled();
      rethrow;
    } finally {
      // 等工作 Isolate 退出后才释放，保证 C 进度回调不会读取失效指针。
      token._handle = null;
      native.native_download_cancel_destroy(handle);
    }
    // 处理下载完成与界面取消几乎同时发生的情况。
    token._checkCancelled();
    return await File(partialPath).rename(outputPath);
  } finally {
    // 先停止进度监听，再删除本次下载的临时文件。
    await subscription.cancel();
    progressPort.close();
    try {
      await staging.delete(recursive: true);
    } on FileSystemException {
      // 清理失败不能覆盖下载结果或原始异常。
    }
  }
}

// 单独的词法作用域避免工作闭包与进度监听器共享捕获上下文。
// 这里只捕获字符串、SendPort 和整数地址，不会携带 onProgress 中的界面对象。
Future<void> _runDownload(
  String url,
  String path,
  SendPort progressPort,
  int cancelAddress,
) {
  return Isolate.run(() => _downloadTo(url, path, progressPort, cancelAddress));
}

void _downloadTo(
  String url,
  String path,
  SendPort progressPort,
  int cancelAddress,
) {
  // libcurl 同步调用当前 Isolate 的回调，再通过消息通知界面。
  // 限制通知频率，避免高频进度事件触发过多页面刷新。
  final stopwatch = Stopwatch()..start();
  var lastReport = -100;
  var lastDownloaded = -1;
  var lastTotal = -1;
  final callback =
      // isolateLocal 要求原生回调发生在当前 Isolate 所在线程；
      // curl_easy_perform 在当前线程同步执行，满足这一条件。
      NativeCallable<Void Function(LongLong, LongLong)>.isolateLocal((
        int downloaded,
        int total,
      ) {
        // 重复进度不通知；通常每 100 毫秒最多更新一次，完成进度立即发送。
        if (downloaded == lastDownloaded && total == lastTotal) return;
        final now = stopwatch.elapsedMilliseconds;
        if (now - lastReport < 100 && !(total > 0 && downloaded >= total)) {
          return;
        }
        lastReport = now;
        lastDownloaded = downloaded;
        lastTotal = total;
        progressPort.send([downloaded, total]);
      });
  try {
    // Arena 在同步原生调用结束后自动释放 URL、路径的 UTF-8 内存。
    using((arena) {
      final urlPtr = url.toNativeUtf8(allocator: arena);
      final pathPtr = path.toNativeUtf8(allocator: arena);
      final code = native.native_download(
        urlPtr.cast(),
        pathPtr.cast(),
        callback.nativeFunction,
        Pointer<native.download_cancel_token>.fromAddress(cancelAddress),
      );
      if (code != 0) {
        // 将 libcurl 管理的 C 字符串复制为 Dart 字符串，无需释放 C 字符串。
        final message = native
            .native_download_error(code)
            .cast<Utf8>()
            .toDartString();
        throw FileSystemException('libcurl ($code) $message', path);
      }
    });
  } finally {
    // 原生调用结束后不再触发进度通知，此时可以安全释放回调入口。
    callback.close();
  }
}
