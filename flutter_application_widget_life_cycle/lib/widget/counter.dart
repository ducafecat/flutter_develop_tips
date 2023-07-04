// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, required this.title});

  final String title;

  // 1. 创建状态
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  // 2. 初始化状态
  // 在小部件创建之前和构建方法之前调用
  @override
  void initState() {
    print('initState');
    super.initState();
    _counter = 10;
  }

  // 3. 当每个依赖项更改此状态时，调用此方法
  // 在构建小部件的第一次调用initState()之后，也可以立即调用它。
  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  // 4. 当小部件重新构建时，将调用此方法。
  // 这个用于取消订阅在initState()中订阅的旧对象，
  // 并在更新的小部件配置需要替换对象时订阅新对象。
  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  // 5. 停用
  // 当小部件暂时从小部件树中移除时，将调用此方法。
  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  // 6. 释放资源
  // 当小部件从小部件树中永久移除时
  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Column(
      children: [
        // 标题
        Text(widget.title),

        // 计数
        ElevatedButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: Text('counter > $_counter'),
        ),
      ],
    );
  }
}
