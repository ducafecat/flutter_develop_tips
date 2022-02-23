import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class LocalAppbarPage extends GetView<LocalAppbarController> {
  const LocalAppbarPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalAppbarController>(
      init: LocalAppbarController(),
      id: "local_appbar",
      builder: (_) {
        ThemeData theme = Get.theme;
        return Theme(
          data: theme.copyWith(
            appBarTheme: theme.appBarTheme.copyWith(
              backgroundColor: theme.colorScheme.tertiary,
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: Text(controller.viewTitle),
            ),
            body: SafeArea(
              child: _buildView(),
            ),
          ),
        );
      },
    );
  }
}
