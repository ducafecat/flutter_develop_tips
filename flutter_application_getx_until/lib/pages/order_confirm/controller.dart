import 'package:get/get.dart';

import '../../common/index.dart';

class OrderConfirmController extends GetxController {
  OrderConfirmController();

  _initData() {
    update(["order_confirm"]);
  }

  void onTap() {
    Get.toNamed(RouteNames.orderDone);
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
