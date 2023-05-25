import 'package:get/get.dart';

import '../../common/index.dart';

class ProductListController extends GetxController {
  ProductListController();

  _initData() {
    update(["product_list"]);
  }

  void onTap() {
    Get.toNamed(RouteNames.productDetail);
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
