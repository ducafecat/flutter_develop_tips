import 'package:flutter/material.dart';
import 'package:flutter_material_design3_theme_getx/models/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class MaterialColorPage extends GetView<MaterialColorController> {
  const MaterialColorPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return ListView.builder(
      itemExtent: 100,
      itemCount: controller.items.length,
      itemBuilder: (BuildContext context, int index) {
        var item = controller.items[index];
        return _buildListItem(item);
      },
    );
  }

  Widget _buildListItem(KeyValueModel<Color> item) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: item.value,
      child: item.key.isEmpty
          ? null
          : Text(
              "${item.key}, ${item.value}",
              style: TextStyle(
                color: item.value.computeLuminance() > 0.4
                    ? Get.theme.colorScheme.primary
                    : Get.theme.colorScheme.onPrimary,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MaterialColorController>(
      init: MaterialColorController(),
      id: "material_color",
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
