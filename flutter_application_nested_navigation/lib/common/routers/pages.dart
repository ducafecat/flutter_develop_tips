import 'package:get/get.dart';

import '../../pages/index.dart';
import 'index.dart';

class RoutePages {
  // 列表
  static List<GetPage> list = [
    GetPage(
      name: RouteNames.main,
      page: () => const MainPage(),
    ),
    GetPage(
      name: RouteNames.step1,
      page: () => const Step1Page(),
    ),
    GetPage(
      name: RouteNames.step2,
      page: () => const Step2Page(),
    ),
    GetPage(
      name: RouteNames.step3,
      page: () => const Step3Page(),
    ),
  ];
}
