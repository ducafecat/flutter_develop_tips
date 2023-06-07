import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/index.dart';
import 'index.dart';

class Step1Page extends GetView<Step1Controller> {
  const Step1Page({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        Get.toNamed(
          RouteNames.step2,
          id: 1,
        );
      },
      child: const Text('go to step2 page'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Step1Controller>(
      init: Step1Controller(),
      id: "step1",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("step1")),
          backgroundColor: Colors.brown,
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
