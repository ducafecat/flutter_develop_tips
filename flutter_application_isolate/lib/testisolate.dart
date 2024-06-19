import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Isolate? _isolate;
  late SendPort _sendPort;
  late SendPort isolateSenport;
  @override
  void initState() {
    super.initState();
    startIsolate();
  }

  @override
  void dispose() {
    super.dispose();
    stopIsolate();
  }

  void startIsolate() async {
    ReceivePort receivePort = ReceivePort();
    _sendPort = receivePort.sendPort;
    _isolate = await Isolate.spawn(isolateFunction, _sendPort);
    receivePort.listen((message) {
      if (message is SendPort) {
        isolateSenport = message;
        // isolateSenport.send('stop for');
      } else if (message == "stop") {
        print("Received stop message");
        stopExecution();
      }
    });
  }

  void stopIsolate() {
    _isolate?.pause();
    _isolate?.kill(priority: Isolate.immediate);
    _isolate = null;
  }

  static void isolateFunction(SendPort sendPort) {
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    receivePort.listen((message) {
      if (message == 'stop for') {
        debugPrint('message==stop for');
        return;
      }
      debugPrint('message==$message');
    });
    for (int i = 0; i < 100; i++) {
      // 模拟一些工作
      print("Working... $i");
    }
  }

  void stopExecution() {
    // _sendPort.send(null); // 发送 null 消息以停止 Isolate 中的循环
    isolateSenport.send('stop for');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Isolate Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: stopExecution,
          child: const Text("Stop Execution"),
        ),
      ),
    );
  }
}
