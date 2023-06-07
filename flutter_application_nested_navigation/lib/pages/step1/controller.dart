import 'package:get/get.dart';

class Step1Controller extends GetxController {
  Step1Controller();

  _initData() {
    update(["step1"]);
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
}
