// ignore_for_file: avoid_print

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectivityPage extends StatefulWidget {
  const ConnectivityPage({super.key});

  @override
  State<ConnectivityPage> createState() => _ConnectivityPageState();
}

class _ConnectivityPageState extends State<ConnectivityPage> {
  // Connectivity 对象
  final Connectivity _connectivity = Connectivity();

  // 消息订阅
  late StreamSubscription<ConnectivityResult> _subscription;

  // 初始返回的网络状态
  ConnectivityResult? _connectivityStatus;

  // 初始化
  Future<void> _init() async {
    try {
      // 方式1：单次请求检查
      // final connectivityResult = await _connectivity.checkConnectivity();
      // _updateConnectionStatus(connectivityResult);

      // 方式2：状态订阅
      _subscription =
          _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    } on PlatformException catch (e) {
      print(e);
      print('连接网络出现了异常');
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectivityStatus = result;
    });

    if (result == ConnectivityResult.mobile) {
      print('成功连接移动网络');
    } else if (result == ConnectivityResult.wifi) {
      print('成功连接WIFI');
    } else if (result == ConnectivityResult.ethernet) {
      print('成功连接到以太网');
    } else if (result == ConnectivityResult.vpn) {
      print('成功连接vpn网络');
    } else if (result == ConnectivityResult.bluetooth) {
      print('成功连接蓝牙');
    } else if (result == ConnectivityResult.other) {
      print('成功连接除以上以外的网络');
    } else if (result == ConnectivityResult.none) {
      print('没有连接到任何网络');
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网路连接检查'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('状态'),
            Text(_connectivityStatus?.toString() ?? "未知"),
          ],
        ),
      ),
    );
  }
}
