import 'package:flutter/material.dart';

import '../states/index.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

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
