import 'package:get/get.dart';

class Step2Controller extends GetxController {
  Step2Controller();

  _initData() {
    update(["step2"]);
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
