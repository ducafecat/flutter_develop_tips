import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/index.dart';
import 'index.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
        child: Column(
      children: [
        // 导航控制
        Container(
          height: 100,
          color: Colors.yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    RouteNames.step1,
                    id: 1,
                  );
                },
                child: const Text('step1 page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    RouteNames.step2,
                    id: 1,
                  );
                },
                child: const Text('step2 page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    RouteNames.step3,
                    id: 1,
                  );
                },
                child: const Text('step3 page'),
              ),
            ],
          ),
        ),

        // 嵌套导航
        SizedBox(
          height: 300,
          child: Navigator(
            key: Get.nestedKey(1),
            initialRoute: '/step1',
            onGenerateRoute: controller.onGenerateRoute,
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("main")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
