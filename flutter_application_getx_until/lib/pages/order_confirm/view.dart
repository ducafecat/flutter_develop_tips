import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class OrderConfirmPage extends GetView<OrderConfirmController> {
  const OrderConfirmPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
      child: ElevatedButton(
        onPressed: controller.onTap,
        child: const Text('前去支付完成页'), // 按钮文字
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderConfirmController>(
      init: OrderConfirmController(),
      id: "order_confirm",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("order_confirm")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
