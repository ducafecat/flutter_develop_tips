// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';

class DynamicIconsPage extends StatefulWidget {
  const DynamicIconsPage({super.key});

  @override
  State<DynamicIconsPage> createState() => _DynamicIconsPageState();
}

class _DynamicIconsPageState extends State<DynamicIconsPage> {
  String curIconName = "";
  int batchNumber = -1;

  @override
  void initState() {
    // 读取动态图标名称
    FlutterDynamicIcon.getAlternateIconName().then((iconName) {
      setState(() {
        curIconName = iconName ?? "---";
      });
    });

    // 读取 badge 数字
    FlutterDynamicIcon.getApplicationIconBadgeNumber().then((value) {
      setState(() {
        batchNumber = value;
      });
    });

    super.initState();
  }

  // 设置图标
  Future<void> setAlternateIcon(String iconName) async {
    try {
      if (await FlutterDynamicIcon.supportsAlternateIcons) {
        await FlutterDynamicIcon.setAlternateIconName(
          iconName,
          showAlert: false,
        );
        setState(() {
          curIconName = iconName;
        });
      }
    } on PlatformException catch (_) {
      print('Failed to change app icon');
    }
  }

  // 主视图
  Widget _buildMain() {
    return Center(
      child: Column(
        children: [
          // 图标名称
          Text(curIconName),

          // 设置图标
          ElevatedButton(
            onPressed: () {
              setAlternateIcon("default");
            },
            child: const Text('default'),
          ),
          ElevatedButton(
            onPressed: () {
              setAlternateIcon("vip");
            },
            child: const Text('Vip'),
          ),
          ElevatedButton(
            onPressed: () {
              setAlternateIcon("svip");
            },
            child: const Text('svip'),
          ),

          // 动态 badge 数字
          Text("$batchNumber"),

          // 文本输入框
          TextField(
            onSubmitted: (value) async {
              await FlutterDynamicIcon.setApplicationIconBadgeNumber(
                  int.parse(value));
              setState(() {
                batchNumber = int.parse(value);
              });
            },
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Icons'),
      ),
      body: _buildMain(),
    );
  }
}
