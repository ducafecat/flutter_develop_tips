import 'package:flutter/material.dart';

import 'widget/index.dart';

class LifeCyclePage extends StatefulWidget {
  const LifeCyclePage({super.key});

  @override
  State<LifeCyclePage> createState() => _LifeCyclePageState();
}

class _LifeCyclePageState extends State<LifeCyclePage> {
  String _title = "https://ducafecat.com";
  bool _closeCounter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LifeCyclePage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // StatelessWidget 组件
            TitleWidget(title: _title),

            // StatefulWidget 组件
            if (_closeCounter == false) CounterWidget(title: _title),

            // 分割线
            const Divider(
              color: Colors.red,
              height: 100,
            ),

            // 改变 title 的按钮
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _title =
                      "https://ducafecat.com/${DateTime.now().millisecondsSinceEpoch}";
                });
              },
              child: const Text("改变 title"),
            ),

            // 关闭 counter 按钮
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _closeCounter = !_closeCounter;
                });
              },
              child: const Text("关闭 counter"),
            ),
          ],
        ),
      ),
    );
  }
}
