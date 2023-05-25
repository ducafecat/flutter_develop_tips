import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ProductListPage extends GetView<ProductListController> {
  const ProductListPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
      child: ElevatedButton(
        onPressed: controller.onTap,
        child: const Text('前去商品详情页'), // 按钮文字
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
      init: ProductListController(),
      id: "product_list",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("product_list")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
