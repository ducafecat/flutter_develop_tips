import 'package:get/get.dart';

import '../../pages/index.dart';
import '../index.dart';

class RoutePages {
  // 列表
  static List<GetPage> list = [
    GetPage(
      name: RouteNames.productList,
      page: () => const ProductListPage(),
    ),
  ];
}
