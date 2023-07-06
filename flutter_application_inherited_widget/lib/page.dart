import 'package:flutter/material.dart';

import 'states/index.dart';
import 'widgets/index.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  // 用户名
  String _userName = '未登录';

  // 修改用户名
  void _changeUserName(String userName) {
    setState(() {
      _userName = userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget'),
      ),
      body: UserProfileState(
        userName: _userName,
        changeUserName: _changeUserName,
        child: SafeArea(
          child: Column(
            children: const [
              // 头部
              HeaderWidget(),

              // 正文
              Expanded(child: UserView()),

              // 底部
              BottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
