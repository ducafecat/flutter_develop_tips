import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../model/user.dart';
import '../widget/nav.dart';
import '../widget/profile.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();

    // 注册单例 - 当前用户
    GetIt.I.registerSingleton<UserModel>(
      UserModel(),
    );
  }

  @override
  void dispose() {
    // 释放
    GetIt.I.unregister<UserModel>();
    super.dispose();
  }

  Widget _buildView(context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // 顶栏
        NavWidget(),

        // 用户信息
        Expanded(child: ProfileWidget()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('用户登录界面'),
      ),
      body: _buildView(context),
    );
  }
}
