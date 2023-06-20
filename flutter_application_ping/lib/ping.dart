// ignore_for_file: avoid_print

import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';

class PingPage extends StatefulWidget {
  const PingPage({super.key});

  @override
  State<PingPage> createState() => _PingPageState();
}

class _PingPageState extends State<PingPage> {
  // 检测域名
  final String _domain = 'baidu.com';
  // 信号量
  int _signalStrength = 0;
  // 返回信息
  String _resString = '';

  // 执行 ping
  void _doPing() {
    _resString = 'ping $_domain \n\n';
    final ping = Ping(_domain, count: 20);
    ping.stream.listen((event) {
      print(event);

      if (event.error != null) {
        // 错误
        setState(() {
          _resString = event.error.toString();
        });
      } else {
        if (event.response != null) {
          // 单次信息
          setState(() {
            _resString += '${event.response}\n';
          });

          // 信号强度
          _signalStrength = calculateSignalStrength(
              event.response?.time?.inMilliseconds ?? 0);
        }

        // 总计
        if (event.summary != null) {
          setState(() {
            _resString += '\n${event.summary}\n';
          });
        }
      }
    });
  }

  // 信号强度 0 ~ 5 , 5 最好，0 最差
  int calculateSignalStrength(int pingDelay) {
    if (pingDelay < 0) {
      // 无网络连接
      return 0;
    } else if (pingDelay < 100) {
      // 延迟 < 100ms，信号强度为 5
      return 5;
    } else if (pingDelay < 200) {
      // 延迟 < 200ms，信号强度为 4
      return 4;
    } else if (pingDelay < 300) {
      // 延迟 < 300ms，信号强度为 3
      return 3;
    } else if (pingDelay < 500) {
      // 延迟 < 500ms，信号强度为 2
      return 2;
    } else {
      // 延迟 >= 500ms，信号强度为 1
      return 1;
    }
  }

  // 信号强度图片
  Widget _buildSignalIcon(BuildContext context) {
    String iconAsset = 'assets/images/signal-$_signalStrength.png';
    return Image.asset(
      iconAsset,
      width: 28,
      height: 28,
      fit: BoxFit.fill,
    );
  }

  Widget _mainView() {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _doPing,
            child: const Text('Start Ping'),
          ),
          Text('信号强度: $_signalStrength'),
          _buildSignalIcon(context),
          Text(_resString),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ping'),
      ),
      body: _mainView(),
    );
  }
}
