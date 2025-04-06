import 'package:flutter/material.dart';
import 'package:flutter_application_autolayout/theme/app_theme.dart';
import 'package:layout/layout.dart';

/// 页面顶部导航栏组件
/// 包含标题、搜索框、ETH余额、通知图标和用户头像
class Header extends StatelessWidget {
  /// 页面标题
  final String title;

  /// 页面副标题/面包屑导航
  final String subtitle;

  const Header({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdaptiveBuilder(
            // 移动设备上垂直布局
            xs: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 标题部分
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // 搜索栏
                _buildSearch(),
                const SizedBox(height: 16),
                // 用户信息部分
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildEthBalance(),
                    Row(
                      children: [
                        _buildNotificationIcon(),
                        const SizedBox(width: 16),
                        _buildAvatar(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // 平板设备上使用水平布局但简化元素
            sm: (context) => Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                _buildSearch(),
                const SizedBox(width: 16),
                _buildAvatar(),
              ],
            ),
            // 桌面设备上显示完整布局
            md: (context) => Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                _buildSearch(),
                const SizedBox(width: 16),
                _buildEthBalance(),
                const SizedBox(width: 16),
                _buildNotificationIcon(),
                const SizedBox(width: 16),
                _buildAvatar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建搜索框组件
  /// 根据可用空间自适应宽度
  Widget _buildSearch() {
    return LayoutBuilder(builder: (context, constraints) {
      // 根据可用空间调整搜索框宽度
      double width = constraints.maxWidth > 300 ? 300 : constraints.maxWidth;
      return Container(
        width: width,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.searchBackground,
          borderRadius: BorderRadius.circular(49),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.textLight,
            ),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
        ),
      );
    });
  }

  /// 构建 ETH 余额显示组件
  /// 显示用户当前的 ETH 余额
  Widget _buildEthBalance() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.searchBackground,
        borderRadius: BorderRadius.circular(49),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            child: Center(
              child: Icon(
                Icons.currency_bitcoin,
                size: 18,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '1,924 ETH',
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建通知图标组件
  /// 显示通知中心入口
  Widget _buildNotificationIcon() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        Icons.notifications_none_outlined,
        color: AppColors.textLight,
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
      ),
      child: Center(
        child: Text(
          'VS',
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
