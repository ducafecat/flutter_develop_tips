import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: RouteNames.main,
      getPages: RoutePages.list,
    );
  }
}
