import 'package:flutter/material.dart';
import 'package:flutter_material_design3_theme_getx/models/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class ColorSchemePage extends GetView<ColorSchemeController> {
  const ColorSchemePage({Key? key}) : super(key: key);

  Widget _buildView() {
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 1,
      children: List.generate(controller.items.length, (index) {
        var item = controller.items[index];
        return _buildListItem(item);
      }),
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
                    ? Colors.black
                    : Colors.white,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ColorSchemeController>(
      init: ColorSchemeController(),
      id: "color_scheme",
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
