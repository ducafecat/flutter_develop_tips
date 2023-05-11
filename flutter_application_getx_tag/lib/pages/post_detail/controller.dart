import 'package:get/get.dart';

import 'index.dart';

class PostDetailController extends GetxController {
  PostDetailController();

  int num = 0;

  _initData() {
    update(["post_detail"]);
  }

  void onTap() {
    num++;
    update(["post_detail"]);
  }

  void onNextPage() {
    // 当前时间戳
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    Get.to(PostDetailPage(),
        routeName: "/post/$timestamp", arguments: {"timestamp": "$timestamp"});
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
