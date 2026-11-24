import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import '../lib/curl_download.dart';

// ReceivePort 不可跨 Isolate 发送，用于模拟页面回调捕获的界面状态。
class ProgressObserver {
  final port = ReceivePort();
  var intermediate = false;

  void onProgress(int downloaded, int total) {
    if (downloaded > 0 && downloaded < total) intermediate = true;
  }
}

Future<void> main() async {
  final observer = ProgressObserver();
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.listen((request) async {
    try {
      request.response.contentLength = 262144;
      for (var i = 0; i < 16; i++) {
        request.response.add(Uint8List(16384));
        await request.response.flush();
        await Future<void>.delayed(const Duration(milliseconds: 30));
      }
      await request.response.close();
    } on SocketException {
      // 取消下载时客户端会主动断开连接。
    } on HttpException {
      // 取消下载时响应可能尚未发送完毕。
    }
  });
  File? file;
  try {
    final directory = Directory('tmp');
    final before = await directory.exists()
        ? (await directory.list().toList()).map((entry) => entry.path).toSet()
        : <String>{};
    final cancelToken = DownloadCancelToken();
    var cancelled = false;
    try {
      await downloadFile(
        'http://127.0.0.1:${server.port}/cancel-regression.bin',
        cancelToken: cancelToken,
        onProgress: (downloaded, total) {
          if (downloaded > 0 && downloaded < total) cancelToken.cancel();
        },
      );
    } on DownloadCancelledException {
      cancelled = true;
    }
    if (!cancelled) throw StateError('中途取消未生效');
    final after = (await directory.list().toList())
        .map((entry) => entry.path)
        .toSet();
    if (after.difference(before).isNotEmpty) {
      throw StateError('取消后留下了临时文件');
    }
    print('PASS: 中途取消并清理临时文件');

    final preCancelled = DownloadCancelToken()..cancel();
    try {
      await downloadFile(
        'http://127.0.0.1:${server.port}/unused.bin',
        cancelToken: preCancelled,
      );
      throw StateError('提前取消未生效');
    } on DownloadCancelledException {
      print('PASS: 提前取消');
    }

    file = await downloadFile(
      'http://127.0.0.1:${server.port}/progress-regression.bin',
      onProgress: observer.onProgress,
    );
    if (await file.length() != 262144 || !observer.intermediate) {
      throw StateError('下载大小或中途进度不符合预期');
    }
    print('PASS: 捕获不可发送对象的回调可正常接收下载进度');
  } finally {
    if (file != null) await file.delete();
    observer.port.close();
    await server.close(force: true);
  }
}
