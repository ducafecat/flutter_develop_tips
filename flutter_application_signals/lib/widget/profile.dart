// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../model/user.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  Widget _buildView(context) {
    var g = GetIt.I;

    // 监听
    effect(() {
      print(g.get<UserModel>().userId);
      print(g.get<UserModel>().userName);
    });

    return Watch(
      (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('用户ID：${g.get<UserModel>().userId}'),
            Text('用户称呼：${g.get<UserModel>().userName}'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView(context);
  }
}
