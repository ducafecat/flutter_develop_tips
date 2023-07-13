import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flutter_plugin_add_platform_interface.dart';

// 类型定义 - 接收函数
typedef TypeOnRecvData = void Function(int value);

class FlutterPluginAdd {
  // event channel 定义
  static const eventChannel =
      EventChannel('com.ducafecat.counter/eventChannel');

  // 订阅
  StreamSubscription? _streamSubscription;

  // 接收函数
  TypeOnRecvData? _onRecvData;

  Future<String?> getPlatformVersion() {
    return FlutterPluginAddPlatform.instance.getPlatformVersion();
  }

  // 加法
  Future<int?> add(int a, int b) {
    return FlutterPluginAddPlatform.instance.add(a, b);
  }

  // 开始计数
  Future<void> startCounting(TypeOnRecvData onRecvData) async {
    _onRecvData = onRecvData;
    if (_streamSubscription == null) {
      bool? isStarting =
          await FlutterPluginAddPlatform.instance.startCounting();
      if (isStarting == true) {
        _streamSubscription =
            eventChannel.receiveBroadcastStream().listen(_listenStream);
      }
    }
  }

  // 取消计数
  void cancelCounting() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
    _onRecvData = null;
  }

  // 接收函数
  void _listenStream(value) {
    debugPrint("Received From Native:  $value\n");
    _onRecvData?.call(value);

    if (value == 50) {
      cancelCounting();
    }
  }

  // 释放
  void dispose() {
    cancelCounting();
  }
}
