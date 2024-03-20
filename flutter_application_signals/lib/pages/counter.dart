import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

// 定义响应对象
final counter = signal(0);

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  Widget _buildView(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // 按钮
          ElevatedButton(
            onPressed: () {
              counter.value++;
            },
            child: const Text('加法计数'),
          ),

          // 显示
          Text(counter.watch(context).toString()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('计数器'),
      ),
      body: _buildView(context),
    );
  }
}
