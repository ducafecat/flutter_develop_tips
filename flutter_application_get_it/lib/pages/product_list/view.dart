import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ProductListPage extends GetView<ProductListController> {
  const ProductListPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return ListView.builder(
      itemCount: controller.products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(controller.products[index].name ?? ""),
          subtitle: Image.network(
            controller.products[index].images?[0].src ?? "",
            height: 100,
            fit: BoxFit.cover,
          ),
        );
      },
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
