import 'package:flutter/material.dart';
import 'package:flutter_application_riverpod/entity/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/todo_list.dart';

class TodoBarStfWidget extends ConsumerStatefulWidget {
  const TodoBarStfWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TodoBarStfWidgetState();
}

class _TodoBarStfWidgetState extends ConsumerState<TodoBarStfWidget> {
  // 待处理的 addTodo 操作。如果没有待处理的，则为 null。
  Future<void>? _pendingAddTodo;

  Widget _buildView() {
    return FutureBuilder(
      // 我们监听待处理的操作，以相应地更新 UI。
      future: _pendingAddTodo,
      builder: (context, snapshot) {
        // 计算是否存在错误状态。
        // 检查 connectionState 用于在重试操作时进行处理。
        // 是否错误
        final isErrored = snapshot.hasError &&
            snapshot.connectionState != ConnectionState.waiting;
        // 是否等待
        final isWaiting = snapshot.connectionState == ConnectionState.waiting;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 按钮
            ElevatedButton(
              style: ButtonStyle(
                // 如果出现错误，我们会将该按钮显示为红色
                backgroundColor: MaterialStateProperty.all(
                  isErrored ? Colors.red : null,
                ),
              ),
              // 设置 null 后按钮灰色禁止点击
              onPressed: isWaiting == true
                  ? null
                  : () {
                      // 我们将 addTodo 返回的 future 保存在变量中
                      final future = ref
                          .read(todoListProvider.notifier)
                          .addTodo(
                              TodoEntity(description: 'This is a new todo'));

                      // 我们将这个 future 存储在本地的状态中
                      setState(() {
                        _pendingAddTodo = future;
                      });
                    },
              child: const Text('Add todo V2'),
            ),

            // 操作正在等待，让我们显示一个进度指示器
            if (isWaiting) ...[
              const SizedBox(width: 8),
              const CircularProgressIndicator(),
            ]
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
