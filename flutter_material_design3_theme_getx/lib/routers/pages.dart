import 'package:get/get.dart';

import '../pages/index.dart';
import 'index.dart';

class RoutePages {
  static List<GetPage> list = [
    GetPage(
      name: RouteName.main,
      page: () => const MainPage(),
    ),
    GetPage(
      name: RouteName.typography,
      page: () => const TypographyPage(),
    ),
    GetPage(
      name: RouteName.colorScheme,
      page: () => const ColorSchemePage(),
    ),
    GetPage(
      name: RouteName.materialColor,
      page: () => const MaterialColorPage(),
    ),
  ];
}
