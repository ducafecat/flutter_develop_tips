import 'package:flutter/material.dart';

import '../states/index.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String? userName = UserProfileState.of(context)?.userName;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: Text('登录：$userName'),
    );
  }
}
