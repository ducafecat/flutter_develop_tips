import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SystemMainPage extends GetView<SystemMainController> {
  const SystemMainPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
      child: ElevatedButton(
        onPressed: controller.onTap,
        child: const Text('前去商品列表'), // 按钮文字
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemMainController>(
      init: SystemMainController(),
      id: "system_main",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("system_main")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
