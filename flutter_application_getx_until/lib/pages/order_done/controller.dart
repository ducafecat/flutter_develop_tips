import 'package:get/get.dart';

import '../../common/index.dart';

class OrderDoneController extends GetxController {
  OrderDoneController();

  _initData() {
    update(["order_done"]);
  }

  void toProductList() {
    Get.until((route) => Get.currentRoute == RouteNames.productList);
  }

  void toUserProfile() {
    Get.offNamedUntil(
      RouteNames.userProfile,
      (route) => route.isFirst,
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
}
