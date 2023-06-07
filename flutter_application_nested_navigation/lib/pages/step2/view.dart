import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/index.dart';
import 'index.dart';

class Step2Page extends GetView<Step2Controller> {
  const Step2Page({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        Get.toNamed(
          RouteNames.step3,
          id: 1,
        );
      },
      child: const Text('go to step3 page'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Step2Controller>(
      init: Step2Controller(),
      id: "step2",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("step2")),
          backgroundColor: Colors.cyanAccent,
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
