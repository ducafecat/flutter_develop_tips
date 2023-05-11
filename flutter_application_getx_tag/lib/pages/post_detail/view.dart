import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PostDetailPage extends GetView<PostDetailController> {
  PostDetailPage({Key? key}) : super(key: key);

  final String timestamp = Get.arguments?["timestamp"] ??
      DateTime.now().millisecondsSinceEpoch.toString();

  @override
  String? get tag => timestamp;

  // 主视图
  Widget _buildView() {
    return Center(
      child: Column(
        children: [
          Text("计数 num : ${controller.num}"),
          ElevatedButton(
            onPressed: controller.onTap,
            child: const Text("加法计算"),
          ),
          ElevatedButton(
            onPressed: controller.onNextPage,
            child: const Text("再开一个界面"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDetailController>(
      init: PostDetailController(),
      tag: timestamp,
      id: "post_detail",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text("post_detail $timestamp")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
