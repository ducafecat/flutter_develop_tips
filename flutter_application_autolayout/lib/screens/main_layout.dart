import 'package:flutter/material.dart';
import 'package:flutter_application_autolayout/components/sidebar.dart';
import 'package:flutter_application_autolayout/screens/marketplace_screen.dart';
import 'package:flutter_application_autolayout/theme/app_theme.dart';
import 'package:layout/layout.dart';

/// 主布局组件
/// 实现响应式布局，根据屏幕尺寸自适应显示侧边栏和主内容
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

/// MainLayout 的状态管理类
/// 处理响应式布局逻辑和侧边栏显示状态
class _MainLayoutState extends State<MainLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // 定义布局断点的响应式值
  final showSidebarInDrawer = LayoutValue(xs: true, md: false);
  final showSidebarInline = LayoutValue(xs: false, md: true);

  @override
  Widget build(BuildContext context) {
    // 使用断点值判断当前设备类型
    final bool isMobileOrTablet = showSidebarInDrawer.resolve(context);
    final bool isDesktop = showSidebarInline.resolve(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      // 只在移动端和平板上显示抽屉
      drawer: isMobileOrTablet ? const Drawer(child: Sidebar()) : null,
      body: AdaptiveBuilder(
        // 移动端和平板布局
        xs: (context) => const MarketplaceScreen(),
        // 桌面端布局
        md: (context) => Row(
          children: [
            const Sidebar(),
            const Expanded(
              child: MarketplaceScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
