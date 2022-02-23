import 'package:flutter/material.dart';
import 'package:flutter_material_design3_theme_getx/models/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class TypographyPage extends GetView<TypographyController> {
  const TypographyPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int pos) {
        var item = controller.items[pos];
        return _buildListItem(item);
      },
      separatorBuilder: (BuildContext context, int pos) {
        return const Divider();
      },
      itemCount: controller.items.length,
    );
  }

  Widget _buildListItem(KeyValueModel<TextStyle?> item) {
    return ListTile(
      title: Text(
        "${item.key}, ${item.value?.fontSize}",
        style: item.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TypographyController>(
      init: TypographyController(),
      id: "typography",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(controller.viewTitle)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
