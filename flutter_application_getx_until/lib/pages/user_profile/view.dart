import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class UserProfilePage extends GetView<UserProfileController> {
  const UserProfilePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("UserProfilePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
      init: UserProfileController(),
      id: "user_profile",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("user_profile")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
