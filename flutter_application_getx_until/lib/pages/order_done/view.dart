import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class OrderDonePage extends GetView<OrderDoneController> {
  const OrderDonePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: controller.toProductList,
            child: const Text('返回 -> 商品列表'), // 按钮文字
          ),
          ElevatedButton(
            onPressed: controller.toUserProfile,
            child: const Text('返回 -> 用户首页'), // 按钮文字
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDoneController>(
      init: OrderDoneController(),
      id: "order_done",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("order_done")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
