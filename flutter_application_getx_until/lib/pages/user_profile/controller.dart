import 'package:get/get.dart';

class UserProfileController extends GetxController {
  UserProfileController();

  _initData() {
    update(["user_profile"]);
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
