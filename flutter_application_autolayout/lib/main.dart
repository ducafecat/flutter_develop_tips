import 'package:flutter/material.dart';
import 'package:flutter_application_autolayout/screens/main_layout.dart';
import 'package:flutter_application_autolayout/theme/app_theme.dart';
import 'package:layout/layout.dart';

/// 应用程序入口函数
/// 初始化并运行应用程序
void main() {
  runApp(const MyApp());
}

/// 应用程序根组件
/// 配置应用程序的主题、路由和布局
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: 'NFT Marketplace',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const MainLayout(),
      ),
    );
  }
}
