import 'package:flutter/material.dart';
import 'package:flutter_application_autolayout/theme/app_theme.dart';

/// 侧边栏菜单项数据模型
/// 存储菜单项的标题、图标和点击事件等信息
class SidebarItem {
  /// 菜单项标题
  final String title;

  /// 菜单项图标
  final IconData icon;

  /// 是否处于激活状态
  final bool isActive;

  /// 点击菜单项的回调函数
  final VoidCallback onTap;

  SidebarItem({
    required this.title,
    required this.icon,
    this.isActive = false,
    required this.onTap,
  });
}

/// 侧边栏导航组件
/// 显示应用程序的主要导航菜单，包括 logo、菜单项和升级广告
class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SidebarItem> menuItems = [
      SidebarItem(
        title: "Dashboard",
        icon: Icons.dashboard_rounded,
        isActive: true,
        onTap: () {},
      ),
      SidebarItem(
        title: "NFT Marketplace",
        icon: Icons.shopping_bag_outlined,
        onTap: () {},
      ),
      SidebarItem(
        title: "Tables",
        icon: Icons.table_chart_outlined,
        onTap: () {},
      ),
      SidebarItem(
        title: "Kanban",
        icon: Icons.view_kanban_outlined,
        onTap: () {},
      ),
      SidebarItem(
        title: "Profile",
        icon: Icons.person_outline,
        onTap: () {},
      ),
      SidebarItem(
        title: "Sign In",
        icon: Icons.login_outlined,
        onTap: () {},
      ),
    ];

    return Container(
      width: 290,
      color: AppColors.white,
      child: Column(
        children: [
          const SizedBox(height: 30),
          _buildLogo(),
          const SizedBox(height: 40),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                ...menuItems.map((item) => _buildMenuItem(item)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Divider(color: Color(0xFFF4F7FE), height: 1),
          ),
          _buildProBanner(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  /// 构建应用程序 logo
  /// 显示应用程序名称和品牌标识
  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            "HORIZON FREE",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建单个菜单项
  /// @param item 菜单项信息对象
  /// @return 可点击的菜单项组件
  Widget _buildMenuItem(SidebarItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: item.isActive ? AppColors.primary : Colors.transparent,
      ),
      child: ListTile(
        onTap: item.onTap,
        leading: Icon(
          item.icon,
          color: item.isActive ? AppColors.white : AppColors.textLight,
          size: 22,
        ),
        title: Text(
          item.title,
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontWeight: item.isActive ? FontWeight.bold : FontWeight.w500,
            fontSize: 16,
            color: item.isActive ? AppColors.white : AppColors.textLight,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  /// 构建升级到专业版的广告横幅
  /// 显示升级优惠信息和视觉效果
  Widget _buildProBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF868CFF), Color(0xFF4318FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upgrade to PRO",
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "to get access to all features! Connect with Venus World!",
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: const Color(0xFFE9EDF7),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: AppColors.white,
                width: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
