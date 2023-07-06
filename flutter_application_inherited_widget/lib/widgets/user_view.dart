import 'dart:math';

import 'package:flutter/material.dart';

import '../states/index.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  String? _userName;

  @override
  void didChangeDependencies() {
    _userName = UserProfileState.of(context)?.userName;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('用户名：$_userName'),
          ElevatedButton(
            onPressed: () {
              // 随机 10 个字母
              String randomString = String.fromCharCodes(
                List.generate(
                  10,
                  (index) => 97 + Random().nextInt(26),
                ),
              );

              // 改变用户名
              UserProfileState.of(context)?.changeUserName(randomString);
            },
            child: const Text('改变名称'),
          ),
        ],
      ),
    );
  }
}
