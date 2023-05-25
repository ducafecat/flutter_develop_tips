import 'package:get/get.dart';

import '../../common/index.dart';

class SystemMainController extends GetxController {
  SystemMainController();

  _initData() {
    update(["system_main"]);
  }

  void onTap() {
    Get.toNamed(RouteNames.productList);
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
