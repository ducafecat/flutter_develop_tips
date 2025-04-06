import 'package:flutter/material.dart';
import 'package:flutter_application_autolayout/theme/app_theme.dart';

/// 历史记录信息数据模型
/// 存储 NFT 交易历史记录的详细信息
class HistoryInfo {
  /// NFT 标题
  final String title;

  /// NFT 作者
  final String author;

  /// 交易时间
  final String time;

  /// 交易价格
  final String price;

  /// NFT 图片路径
  final String imagePath;

  HistoryInfo({
    required this.title,
    required this.author,
    required this.time,
    required this.price,
    required this.imagePath,
  });
}

/// NFT 交易历史记录卡片组件
/// 展示单条 NFT 交易历史的详细信息，包括标题、作者、时间和价格
class HistoryCard extends StatelessWidget {
  /// 历史记录信息
  final HistoryInfo historyInfo;

  /// 是否高亮显示
  final bool isHighlighted;

  const HistoryCard({
    super.key,
    required this.historyInfo,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: isHighlighted ? AppColors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isHighlighted
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
        // 如果空间不足，使用紧凑的垂直布局
        if (constraints.maxWidth < 300) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildImage(),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          historyInfo.time,
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.textLight,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          historyInfo.title,
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'By ${historyInfo.author}',
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.textLight,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  _buildPrice(),
                ],
              ),
            ],
          );
        }

        // 正常水平布局
        return Row(
          children: [
            _buildImage(),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    historyInfo.time,
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.textLight,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    historyInfo.title,
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'By ${historyInfo.author}',
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.textLight,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            _buildPrice(),
          ],
        );
      }),
    );
  }

  /// 构建 NFT 图片
  /// 显示 NFT 的缩略图
  Widget _buildImage() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(historyInfo.imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// 从字符串生成随机颜色
  /// @param str 输入字符串
  /// @return 根据字符串生成的颜色
  Color getColorFromString(String str) {
    int hash = 0;
    for (var i = 0; i < str.length; i++) {
      hash = str.codeUnitAt(i) + ((hash << 5) - hash);
    }
    final int finalHash = hash.abs() % 0xFFFFFF;
    return Color(0xFF000000 + finalHash);
  }

  /// 构建价格显示组件
  /// 显示 NFT 的交易价格
  Widget _buildPrice() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.currency_bitcoin,
          color: AppColors.textPrimary,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          historyInfo.price,
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
