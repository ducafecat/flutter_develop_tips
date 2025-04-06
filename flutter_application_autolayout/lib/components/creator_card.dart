import 'package:flutter/material.dart';
import 'package:flutter_application_autolayout/theme/app_theme.dart';

/// 创作者信息数据模型
/// 存储创作者的基本信息，包括用户名、作品数量、评分和头像颜色
class CreatorInfo {
  /// 创作者用户名
  final String username;

  /// 创作者作品数量
  final String artworks;

  /// 创作者评分（0-10）
  final double rating;

  /// 创作者头像背景颜色
  final Color avatarColor;

  /// 创作者头像图片路径
  final String avatarPath;

  CreatorInfo({
    required this.username,
    required this.artworks,
    required this.rating,
    required this.avatarColor,
    required this.avatarPath,
  });
}

/// 创作者卡片组件
/// 展示创作者的基本信息，包括头像、用户名、作品数量和评分
class CreatorCard extends StatelessWidget {
  /// 创作者信息
  final CreatorInfo creator;

  /// 卡片索引，用于确定是否显示特殊样式
  final int index;

  const CreatorCard({
    super.key,
    required this.creator,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: index == 0 ? AppColors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        boxShadow: index == 0
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        // 如果空间不足，使用更紧凑的布局
        if (constraints.maxWidth < 300) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildAvatar(),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      creator.username,
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${creator.artworks} artworks',
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.textLight,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 60,
                    child: _buildRatingBar(),
                  ),
                ],
              ),
            ],
          );
        }

        // 正常布局
        return Row(
          children: [
            _buildAvatar(),
            const SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: Text(
                creator.username,
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                creator.artworks,
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.textLight,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: _buildRatingBar(),
            ),
          ],
        );
      }),
    );
  }

  /// 构建创作者头像
  /// 显示一个带有背景色的圆角方形头像
  Widget _buildAvatar() {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: creator.avatarColor,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(creator.avatarPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// 构建评分条
  /// 显示创作者评分的进度条
  Widget _buildRatingBar() {
    return SizedBox(
      width: 80,
      child: Stack(
        children: [
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF4FB),
              borderRadius: BorderRadius.circular(21),
            ),
          ),
          FractionallySizedBox(
            widthFactor: creator.rating / 10,
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(21),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
