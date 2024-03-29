import 'package:flutter/material.dart';

import 'widgets/bar.dart';
import 'widgets/bar_stf.dart';
import 'widgets/list.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  Widget _buildView(BuildContext context) {
    return const Center(
      child: Column(
        children: <Widget>[
          // StatelessWidget 的组件
          TodoBarWidget(),

          // StatefulWidget 的组件
          TodoBarStfWidget(),

          // ConsumerWidget 的列表
          Expanded(
            child: TodoListWidget(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: _buildView(context),
    );
  }
}
