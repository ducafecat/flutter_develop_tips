import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entity/todo.dart';
import '../../../provider/todo_list.dart';

class TodoBarWidget extends StatelessWidget {
  const TodoBarWidget({super.key});

  Widget _buildView() {
    // Consumer 提供监听功能的小部件
    return Consumer(builder: (
      BuildContext context,
      WidgetRef ref,
      Widget? widget,
    ) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // 事件处理用 read 方式读取 provider
              ref.read(todoListProvider.notifier).addTodo(
                    TodoEntity(
                      description: 'This is a new todo',
                    ),
                  );
            },
            child: const Text('Add todo'),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
