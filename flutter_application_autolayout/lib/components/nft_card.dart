import 'package:flutter/material.dart';
import 'package:flutter_application_autolayout/theme/app_theme.dart';

/// NFT 卡片组件
/// 展示单个 NFT 的详细信息，包括图片、标题、作者、当前出价等
class NFTCard extends StatelessWidget {
  /// NFT 标题
  final String title;

  /// NFT 作者
  final String author;

  /// 当前出价
  final String currentBid;

  /// NFT 图片路径
  final String imagePath;

  /// 点击卡片的回调函数
  final VoidCallback onTap;

  const NFTCard({
    super.key,
    required this.title,
    required this.author,
    required this.currentBid,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: _buildFavoriteButton(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'By $author',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.textLight,
                  ),
                ),
                const SizedBox(height: 16),
                LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth < 250) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildAvatarStack(),
                        const SizedBox(height: 8),
                        Text(
                          'Bid: $currentBid',
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    );
                  }
                  return Row(
                    children: [
                      _buildAvatarStack(),
                      Expanded(
                        child: Text(
                          'Current Bid: $currentBid',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppColors.primary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onTap,
                    child: const Text('Place Bid'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建收藏按钮
  /// 显示在 NFT 图片右上角的心形收藏按钮
  Widget _buildFavoriteButton() {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(70),
      ),
      child: const Icon(
        Icons.favorite,
        color: AppColors.primary,
        size: 18,
      ),
    );
  }

  /// 构建头像堆叠组件
  /// 显示参与竞价的用户头像堆叠效果
  Widget _buildAvatarStack() {
    return SizedBox(
      width: 100,
      height: 24,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: _buildAvatar(0xFF4318FF),
          ),
          Positioned(
            left: 16,
            child: _buildAvatar(0xFF868CFF),
          ),
          Positioned(
            left: 32,
            child: _buildAvatar(0xFFE0E5F2),
          ),
          Positioned(
            left: 48,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.white,
                  width: 2,
                ),
              ),
              child: const Center(
                child: Text(
                  '18+',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建单个头像组件
  /// @param color 头像背景颜色
  Widget _buildAvatar(int color) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.white,
          width: 2,
        ),
      ),
    );
  }

  Color getColorFromString(String str) {
    int hash = 0;
    for (var i = 0; i < str.length; i++) {
      hash = str.codeUnitAt(i) + ((hash << 5) - hash);
    }
    final int finalHash = hash.abs() % 0xFFFFFF;
    return Color(0xFF000000 + finalHash);
  }
}
