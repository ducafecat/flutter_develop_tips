import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../model/user.dart';

class NavWidget extends StatelessWidget {
  const NavWidget({super.key});

  Widget _buildView(context) {
    var g = GetIt.I;
    return Container(
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // 按钮
          ElevatedButton(
            onPressed: () {
              // 执行登录
              g.get<UserModel>().login();
            },
            child: const Text('登录'),
          ),
          // 按钮2
          ElevatedButton(
            onPressed: () {
              // 执行登录
              g.get<UserModel>().login2();
            },
            child: const Text('登录2'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView(context);
  }
}
