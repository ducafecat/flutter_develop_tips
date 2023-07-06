import 'package:flutter/material.dart';

/// 用户登录信息
class UserProfileState extends InheritedWidget {
  const UserProfileState({
    super.key,
    required this.userName,
    required this.changeUserName,
    required Widget child, // 包含的子节点
  }) : super(child: child);

  /// 用户名
  final String userName;

  /// 修改用户名
  final Function changeUserName;

  static UserProfileState? of(BuildContext context) {
    final userProfile =
        context.dependOnInheritedWidgetOfExactType<UserProfileState>();

    // 安全检查
    assert(userProfile != null, 'No UserProfileState found in context');

    return userProfile;
  }

  @override
  bool updateShouldNotify(UserProfileState oldWidget) {
    return userName != oldWidget.userName;
  }
}
