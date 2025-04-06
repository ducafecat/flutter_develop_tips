import 'package:flutter/material.dart';
import 'package:flutter_application_autolayout/theme/app_theme.dart';

/// 主页横幅组件
/// 展示 NFT 市场的主要宣传信息，包含背景图片、标题、描述和操作按钮
class HeroBanner extends StatelessWidget {
  /// 点击"探索"按钮的回调函数
  final VoidCallback onExploreClick;

  /// 点击"观看视频"按钮的回调函数
  final VoidCallback onWatchVideoClick;

  const HeroBanner({
    super.key,
    required this.onExploreClick,
    required this.onWatchVideoClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/products_2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.4),
            ],
          ),
        ),
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 450,
              child: Text(
                'Discover, collect, and sell extraordinary NFTs',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 450,
              child: Text(
                'Enter in this creative world. Discover now the latest NFTs or start creating your own!',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                ElevatedButton(
                  onPressed: onExploreClick,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Discover now',
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: onWatchVideoClick,
                  child: Text(
                    'Watch video',
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: const Color(0xFFE9E3FF),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
