// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:path_provider/path_provider.dart';

@pragma('vm:entry-point')
void someFunction(String arg) {
  print("Running in an isolate with argument : $arg");
}

@pragma('vm:entry-point')
Future<int> expensiveWork(int arg) async {
  int result = arg + 100;
  return result;
}

@pragma('vm:entry-point')
void isolate2(String arg) {
  getTemporaryDirectory().then((dir) async {
    print("isolate2 temporary directory: $dir");

    await FlutterDownloader.initialize(debug: true);
    FlutterDownloader.registerCallback(MarkdownView.downloaderCallback);

    final taskId = await FlutterDownloader.enqueue(
        url:
            "https://raw.githubusercontent.com/rmawatson/flutter_isolate/master/README.md",
        savedDir: dir.path);
  });
  Timer.periodic(const Duration(seconds: 1),
      (timer) => print("Timer Running From Isolate 2"));
}

@pragma('vm:entry-point')
void isolate1(String arg) async {
  await FlutterIsolate.spawn(isolate2, "hello2");

  getTemporaryDirectory().then((dir) {
    print("isolate1 temporary directory: $dir");
  });
  Timer.periodic(const Duration(seconds: 1),
      (timer) => print("Timer Running From Isolate 1"));
}

/////////////////////////

class OnePage extends StatefulWidget {
  const OnePage({super.key});

  @override
  State<OnePage> createState() => OnePageState();
}

class OnePageState extends State<OnePage> {
  Widget _main() {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            child: const Text('01 - 简单的执行顶层函数'),
            onPressed: () {
              FlutterIsolate.spawn(someFunction, "hello world");
            },
          ),
          ElevatedButton(
            child: const Text('02 - Compute函数'),
            onPressed: () async {
              var res = await flutterCompute(expensiveWork, 123);
              print(res);
            },
          ),
          ElevatedButton(
            child: const Text('03 - isolate 嵌套执行'),
            onPressed: () async {
              final isolate = await FlutterIsolate.spawn(isolate1, "hello");
              // // 5 秒后暂停
              // Timer(const Duration(seconds: 5), () {
              //   print("Pausing Isolate 1");
              //   isolate.pause();
              // });

              // // 10 秒后恢复
              // Timer(const Duration(seconds: 10), () {
              //   print("Resuming Isolate 1");
              //   isolate.resume();
              // });

              // // 20 秒后杀死
              // Timer(const Duration(seconds: 20), () {
              //   print("Killing Isolate 1");
              //   isolate.kill();
              // });
            },
          ),
          ElevatedButton(
            child: const Text('04 - 杀掉全部'),
            onPressed: () async {
              await FlutterIsolate.killAll();
            },
          ),

          // markdown
          const MarkdownView(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One'),
      ),
      body: _main(),
    );
  }
}

/// markdown 视图显示
class MarkdownView extends StatelessWidget {
  const MarkdownView({super.key});

  static void downloaderCallback(String id, int status, int progress) {
    print("progress: $progress");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
