import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_add/flutter_plugin_add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterPluginAddPlugin = FlutterPluginAdd();

  // 加法返回
  int addResult = 0;

  // 计数器返回
  int counterResult = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void deactivate() {
    _flutterPluginAddPlugin.dispose();
    super.deactivate();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _flutterPluginAddPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),

              // 加法
              Text('add: $addResult'),
              ElevatedButton(
                onPressed: () async {
                  int? val = await _flutterPluginAddPlugin.add(addResult, 1);
                  setState(() {
                    addResult = val ?? -1;
                  });
                },
                child: const Text('add'),
              ),

              // 计数 event
              Text('count: $counterResult'),
              ElevatedButton(
                onPressed: () {
                  _flutterPluginAddPlugin.startCounting((value) {
                    setState(() {
                      counterResult = value;
                    });
                  });
                },
                child: const Text('开始计数'),
              ),
              ElevatedButton(
                onPressed: () {
                  _flutterPluginAddPlugin.cancelCounting();
                },
                child: const Text('结束计数'),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
