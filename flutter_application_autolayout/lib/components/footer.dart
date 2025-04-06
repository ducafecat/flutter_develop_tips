import 'package:flutter/material.dart';
import 'package:flutter_application_autolayout/theme/app_theme.dart';
import 'package:layout/layout.dart';

/// 页脚链接数据模型
/// 存储页脚导航链接的标题和点击事件
class FooterLink {
  /// 链接标题
  final String title;

  /// 点击链接的回调函数
  final VoidCallback onTap;

  FooterLink({
    required this.title,
    required this.onTap,
  });
}

/// 页脚组件
/// 显示版权信息和导航链接，支持响应式布局
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FooterLink> links = [
      FooterLink(
        title: 'Marketplace',
        onTap: () {},
      ),
      FooterLink(
        title: 'License',
        onTap: () {},
      ),
      FooterLink(
        title: 'Terms of Use',
        onTap: () {},
      ),
      FooterLink(
        title: 'Blog',
        onTap: () {},
      ),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: AdaptiveBuilder(
        xs: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '© 2022 Horizon UI. All Rights Reserved.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.textLight,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 24,
              runSpacing: 8,
              children: links.map((link) => _buildFooterLink(link)).toList(),
            ),
          ],
        ),
        md: (context) => Row(
          children: [
            Expanded(
              child: Text(
                '© 2022 Horizon UI. All Rights Reserved. Made with love by Simmmple!',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.textLight,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: links.map((link) => _buildFooterLink(link)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建页脚链接组件
  /// @param link 链接信息对象
  /// @return 可点击的链接文本组件
  Widget _buildFooterLink(FooterLink link) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: InkWell(
        onTap: link.onTap,
        child: Text(
          link.title,
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.textLight,
          ),
        ),
      ),
    );
  }
}
