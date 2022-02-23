import 'package:get/get.dart';

class LocalAppbarController extends GetxController {
  LocalAppbarController();
  final String viewTitle = Get.arguments["title"] ?? "no title name";

  _initData() {
    update(["local_appbar"]);
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
