import 'package:flutter/material.dart';
import 'package:flutter_material_design3_theme_getx/extensions/index.dart';
import 'package:flutter_material_design3_theme_getx/models/index.dart';
import 'package:get/get.dart';

class MaterialColorController extends GetxController {
  MaterialColorController();

  final String viewTitle = Get.arguments["title"] ?? "no title name";
  late final MaterialColor myColor;
  List<KeyValueModel<Color>> items = [];

  _initData() {
    myColor = "#B36200".toColor().materialColor;
    items = [
      KeyValueModel<Color>("50", myColor.shade50),
      KeyValueModel<Color>("100", myColor.shade100),
      KeyValueModel<Color>("200", myColor.shade200),
      KeyValueModel<Color>("300", myColor.shade300),
      KeyValueModel<Color>("400", myColor.shade400),
      KeyValueModel<Color>("500", myColor.shade500),
      KeyValueModel<Color>("600", myColor.shade600),
      KeyValueModel<Color>("700", myColor.shade700),
      KeyValueModel<Color>("800", myColor.shade800),
      KeyValueModel<Color>("900", myColor.shade900),
    ];

    update(["material_color"]);
  }

  void onTap() {}

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
