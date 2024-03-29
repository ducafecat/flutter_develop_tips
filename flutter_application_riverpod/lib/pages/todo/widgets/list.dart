import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entity/todo.dart';
import '../../../provider/todo_list.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({super.key});

  Widget _buildList(ref) {
    var todos = ref.watch(todoListProvider);
    return switch (todos) {
      AsyncData<List<TodoEntity>>(:final value) => ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(value[index].description ?? ""),
              subtitle: Text((value[index].completed ?? false) ? "yes" : "no"),
            );
          },
        ),
      AsyncError() => const Text('Oops, something unexpected happened'),
      _ => const CircularProgressIndicator(),
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildList(ref);
  }
}
