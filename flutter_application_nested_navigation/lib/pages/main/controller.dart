import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class MainController extends GetxController {
  MainController();

  _initData() {
    update(["main"]);
  }

  final pages = <String>['/list', '/detail', '/login'];

  void changePage(int index) {
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/step1') {
      return GetPageRoute(
        settings: settings,
        page: () => const Step1Page(),
        transition: Transition.topLevel,
      );
    } else if (settings.name == '/step2') {
      return GetPageRoute(
        settings: settings,
        page: () => const Step2Page(),
        transition: Transition.rightToLeftWithFade,
      );
    } else if (settings.name == '/step3') {
      return GetPageRoute(
        settings: settings,
        page: () => const Step3Page(),
        transition: Transition.fadeIn,
      );
    }

    return null;
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
}
