import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routers/index.dart';
import 'services/index.dart';
import 'style/index.dart';

void main() {
  appInit();
}

appInit() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<GlobalService>(GlobalService());

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: RouteName.main,
    theme:
        GlobalService.to.isDarkModel == true ? AppTheme.dark : AppTheme.light,
    defaultTransition: Transition.fade,
    getPages: RoutePages.list,
    // home: HomePage(),
  ));
}
