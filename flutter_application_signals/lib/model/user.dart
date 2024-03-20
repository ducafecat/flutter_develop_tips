import 'package:signals_flutter/signals_flutter.dart';

import '../entity/user.dart';

class UserModel {
  final _user = signal<UserEntrty>(UserEntrty());

  // 当前用户名
  String get userName => _user.value.name ?? "";

  // 当前用户Id
  String get userId => _user.value.id ?? "";

  // 登录 1
  Future login() async {
    // await Future.delayed(const Duration(seconds: 2));
    _user.value = UserEntrty(
      id: "1000001",
      name: "张三",
      email: "zhangshan@gmail.com",
    );
  }

  // 登录 2
  Future login2() async {
    // await Future.delayed(const Duration(seconds: 2));
    _user.value = UserEntrty(
      id: "1000002",
      name: "张三2",
      email: "zhangshan2@gmail.com",
    );
  }
}
