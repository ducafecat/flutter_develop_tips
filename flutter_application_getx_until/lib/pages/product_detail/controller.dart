import 'package:get/get.dart';

import '../../common/index.dart';

class ProductDetailController extends GetxController {
  ProductDetailController();

  _initData() {
    update(["product_detail"]);
  }

  void onTap() {
    Get.toNamed(RouteNames.orderConfirm);
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
