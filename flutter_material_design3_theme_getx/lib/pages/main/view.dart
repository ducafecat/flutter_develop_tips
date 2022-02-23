import 'package:flutter/material.dart';
import 'package:flutter_material_design3_theme_getx/models/index.dart';
import 'package:flutter_material_design3_theme_getx/services/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }
}

class _MainViewGetX extends GetView<MainController> {
  const _MainViewGetX({Key? key}) : super(key: key);

  // 内容页
  Widget _buildView() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int pos) {
        var item = controller.items[pos];
        return _buildListItem(item);
      },
      separatorBuilder: (BuildContext context, int pos) {
        return const Divider(height: 1);
      },
      itemCount: controller.items.length,
    );
  }

  Widget _buildListItem(KeyValueModel<String> item) {
    return ListTile(
      onTap: () => controller.onToRouter(item),
      title: Text(item.key),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("Material Design 3 规范")),
          body: SafeArea(
            child: _buildView(),
          ),
          floatingActionButton: Obx(() {
            return FloatingActionButton(
              onPressed: () {
                GlobalService.to.switchThemeModel();
              },
              child: Icon(
                GlobalService.to.isDarkModel == true
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            );
          }),
        );
      },
    );
  }
}
