import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 1 定义代码生成的文件，文件名一直为 index
part 'index.g.dart';

// 2 注解方式，定义一个 Provider
@riverpod
String helloWorld(HelloWorldRef ref) {
  return 'Hello world';
}

// 3 定义 ConsumerWidget
class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 4 通过 ref 方式获取 Provider 的值
    final String value = ref.watch(helloWorldProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('hello word')),
      body: Center(
        child: Text(value),
      ),
    );
  }
}
