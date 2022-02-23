import 'package:flutter/material.dart';
import 'package:flutter_material_design3_theme_getx/models/index.dart';
import 'package:get/get.dart';

class TypographyController extends GetxController {
  TypographyController();

  final String viewTitle = Get.arguments["title"] ?? "no title name";
  List<KeyValueModel<TextStyle?>> items = [];

  _initData() {
    TextTheme tt = Get.textTheme;
    items = [
      // displayLarge
      KeyValueModel<TextStyle?>("displayLarge", tt.displayLarge),
      KeyValueModel<TextStyle?>("displayMedium", tt.displayMedium),
      KeyValueModel<TextStyle?>("displaySmall", tt.displaySmall),
      // headlineLarge
      KeyValueModel<TextStyle?>("headlineLarge", tt.headlineLarge),
      KeyValueModel<TextStyle?>("headlineMedium", tt.headlineMedium),
      KeyValueModel<TextStyle?>("headlineSmall", tt.headlineSmall),
      // titleLarge
      KeyValueModel<TextStyle?>("titleLarge", tt.titleLarge),
      KeyValueModel<TextStyle?>("titleMedium", tt.titleMedium),
      KeyValueModel<TextStyle?>("titleSmall", tt.titleSmall),
      // bodyLarge
      KeyValueModel<TextStyle?>("bodyLarge", tt.bodyLarge),
      KeyValueModel<TextStyle?>("bodyMedium", tt.bodyMedium),
      KeyValueModel<TextStyle?>("bodySmall", tt.bodySmall),
      // labelLarge
      KeyValueModel<TextStyle?>("labelLarge", tt.labelLarge),
      KeyValueModel<TextStyle?>("labelMedium", tt.labelMedium),
      KeyValueModel<TextStyle?>("labelMedium", tt.labelMedium),
      // headline 1~6
      KeyValueModel<TextStyle?>("headline1", tt.headline1),
      KeyValueModel<TextStyle?>("headline2", tt.headline2),
      KeyValueModel<TextStyle?>("headline3", tt.headline3),
      KeyValueModel<TextStyle?>("headline4", tt.headline4),
      KeyValueModel<TextStyle?>("headline5", tt.headline5),
      KeyValueModel<TextStyle?>("headline6", tt.headline6),
      // subtitle
      KeyValueModel<TextStyle?>("subtitle1", tt.subtitle1),
      KeyValueModel<TextStyle?>("subtitle2", tt.subtitle2),
      // bodyText
      KeyValueModel<TextStyle?>("bodyText1", tt.bodyText1),
      KeyValueModel<TextStyle?>("bodyText2", tt.bodyText2),
      // other
      KeyValueModel<TextStyle?>("caption", tt.caption),
      KeyValueModel<TextStyle?>("button", tt.button),
      KeyValueModel<TextStyle?>("overline", tt.overline),
    ];

    update(["typography"]);
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
