import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entity/todo.dart';

part 'todo_list.g.dart';

@riverpod
class TodoList extends _$TodoList {
  static List<TodoEntity> items = [];

  @override
  Future<List<TodoEntity>> build() async {
    return items;
  }

  Future<void> addTodo(TodoEntity todo) async {
    // await http.post(
    //   Uri.https('your_api.com', '/todos'),
    //   // 我们序列化 Todo 对象并将其 POST 到服务器。
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(todo.toJson()),
    // );

    // 延迟 1 秒
    await Future.delayed(const Duration(seconds: 1));

    // 我们将新的 Todo 添加到 items 列表中。
    items.add(todo);

    // 01 直接设置新状态值
    // state = AsyncData(items);

    // 02
    // 将本地缓存标记为脏
    ref.invalidateSelf();
    // 重新构建 TodoList, 呼叫 build 方法
    await future;
  }
}
