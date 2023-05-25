import 'package:get/get.dart';

import '../../pages/index.dart';
import 'index.dart';

class RoutePages {
  // 列表
  static List<GetPage> list = [
    GetPage(
      name: RouteNames.main,
      page: () => const SystemMainPage(),
    ),
    GetPage(
      name: RouteNames.orderConfirm,
      page: () => const OrderConfirmPage(),
    ),
    GetPage(
      name: RouteNames.orderDone,
      page: () => const OrderDonePage(),
    ),
    GetPage(
      name: RouteNames.productDetail,
      page: () => const ProductDetailPage(),
    ),
    GetPage(
      name: RouteNames.productList,
      page: () => const ProductListPage(),
    ),
    GetPage(
      name: RouteNames.userProfile,
      page: () => const UserProfilePage(),
    ),
  ];
}
