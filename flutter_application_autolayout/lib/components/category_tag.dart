import 'package:flutter/material.dart';
import 'package:flutter_application_autolayout/theme/app_theme.dart';

/// 分类标签组件
/// 用于显示和选择 NFT 的分类，支持激活状态显示
class CategoryTag extends StatelessWidget {
  /// 分类标题
  final String title;

  /// 是否处于激活状态
  final bool isActive;

  /// 点击标签的回调函数
  final VoidCallback onTap;

  const CategoryTag({
    super.key,
    required this.title,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(70),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
