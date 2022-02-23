import 'package:flutter_material_design3_theme_getx/models/index.dart';
import 'package:flutter_material_design3_theme_getx/routers/index.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController();

  List<KeyValueModel<String>> items = [];

  _initData() {
    items.addAll([
      KeyValueModel<String>("ColorScheme 颜色", RouteName.colorScheme),
      KeyValueModel<String>("MaterialColor 色阶", RouteName.materialColor),
      KeyValueModel<String>("Typography 字体", RouteName.typography),
      KeyValueModel<String>("AppBar 局部背景修改", RouteName.localAppbar),
    ]);

    update(["main"]);
  }

  void onTap() {}

  void onToRouter(KeyValueModel<String> item) {
    Get.toNamed(
      item.value,
      arguments: {
        "title": item.key,
      },
    );
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
