import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class Step3Page extends GetView<Step3Controller> {
  const Step3Page({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("Step3Page"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Step3Controller>(
      init: Step3Controller(),
      id: "step3",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("step3")),
          backgroundColor: Colors.green,
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
