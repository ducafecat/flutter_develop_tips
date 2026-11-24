import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_ffigen_curl_demo/curl_download.dart';
import 'package:material_ui/material_ui.dart';

// 应用入口，加载下载演示页面。
void main() => runApp(const DownloadApp());

class DownloadApp extends StatelessWidget {
  const DownloadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FFIgen 下载',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF145F55)),
        useMaterial3: true,
      ),
      home: const DownloadPage(),
    );
  }
}

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  // 默认使用较大的测试文件，方便观察进度与测试中途取消。
  final _address = TextEditingController(
    text: 'https://proof.ovh.net/files/100Mb.dat',
  );
  // 下载期间禁用地址输入和重复下载；取消等待期间另外禁用取消按钮。
  bool _downloading = false;
  bool _cancelling = false;
  // 每次下载独立持有一个取消标记，任务结束后清空。
  DownloadCancelToken? _cancelToken;
  // 取消提示与错误信息分别显示。
  String? _status;
  // 以字节为单位；总大小为 0 时显示不确定进度动画。
  int _downloaded = 0;
  int _total = 0;
  File? _file;
  int? _size;
  String? _error;

  @override
  void dispose() {
    // 页面销毁时请求取消，后台任务自行完成资源清理。
    _cancelToken?.cancel();
    _address.dispose();
    super.dispose();
  }

  Future<void> _download() async {
    // 防止按钮点击或输入框提交导致重复启动。
    if (_downloading) return;
    final address = _address.text;
    final cancelToken = DownloadCancelToken();
    _cancelToken = cancelToken;
    // 清除上一次结果，并切换到下载状态。
    setState(() {
      _downloading = true;
      _cancelling = false;
      _status = null;
      _downloaded = 0;
      _total = 0;
      _file = null;
      _size = null;
      _error = null;
    });

    try {
      final file = await downloadFile(
        address,
        cancelToken: cancelToken,
        onProgress: (downloaded, total) {
          // 进度在界面 Isolate 回调；页面销毁后不能再调用 setState。
          if (!mounted || !_downloading) return;
          setState(() {
            _downloaded = downloaded;
            _total = total;
          });
        },
      );
      final size = await file.length();
      // 异步操作结束后再次确认页面仍在，再展示成功结果。
      if (!mounted) return;
      setState(() {
        _file = file;
        _size = size;
      });
    } on DownloadCancelledException {
      // 主动取消属于正常操作，不显示为红色错误。
      if (mounted) setState(() => _status = '下载已取消');
    } catch (error) {
      // 提取常见异常中的可读消息，其他异常使用默认文本。
      if (!mounted) return;
      final message = switch (error) {
        FormatException(:final message) => message,
        FileSystemException(:final message) => message,
        _ => error.toString(),
      };
      setState(() => _error = message);
    } finally {
      // 无论成功、失败还是取消，都恢复可下载状态。
      _cancelToken = null;
      if (mounted) {
        setState(() {
          _downloading = false;
          _cancelling = false;
        });
      }
    }
  }

  Future<void> _copyPath(String path) async {
    // 复制最终文件路径，并在页面仍存在时显示提示。
    await Clipboard.setData(ClipboardData(text: path));
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('已复制文件路径')));
  }

  @override
  Widget build(BuildContext context) {
    final file = _file;
    final error = _error;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('FFIgen · libcurl')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('下载文件', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 20),
                TextField(
                  controller: _address,
                  enabled: !_downloading,
                  decoration: const InputDecoration(
                    labelText: '文件 URL',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.url,
                  onSubmitted: (_) => _download(),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: _downloading ? null : _download,
                  icon: const Icon(Icons.download),
                  label: Text(_downloading ? '下载中…' : '下载文件'),
                ),
                if (_downloading) ...[
                  // 取消采用协作方式：先设置标记，等待原生回调中断并释放资源。
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: _cancelling
                        ? null
                        : () {
                            _cancelToken?.cancel();
                            setState(() => _cancelling = true);
                          },
                    icon: const Icon(Icons.close),
                    label: Text(_cancelling ? '正在取消…' : '取消下载'),
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    // 已知总大小时显示 0～1 的进度，否则使用循环动画。
                    value: _total > 0
                        ? (_downloaded / _total).clamp(0.0, 1.0)
                        : null,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _total > 0
                        ? '${((_downloaded / _total).clamp(0.0, 1.0) * 100).toStringAsFixed(1)}% · $_downloaded / $_total 字节'
                        : '已下载 $_downloaded 字节 · 总大小未知',
                  ),
                ],
                if (_status != null) ...[
                  const SizedBox(height: 20),
                  Text(_status!),
                ],
                if (error != null) ...[
                  const SizedBox(height: 20),
                  SelectableText(
                    error,
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                ],
                if (file != null) ...[
                  const SizedBox(height: 20),
                  Text('下载完成 · $_size 字节', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  SelectableText(file.path),
                  TextButton.icon(
                    onPressed: () => _copyPath(file.path),
                    icon: const Icon(Icons.copy),
                    label: const Text('复制路径'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
