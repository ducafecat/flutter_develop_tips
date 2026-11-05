import 'dart:ui';

import 'package:flutter/material.dart';

/// 可复用的毛玻璃容器。
///
/// 对组件后方已绘制的内容进行模糊，前景文字和图标保持清晰。
/// 使用时应将其叠放在图片等背景内容之上。
class FrostedGlass extends StatelessWidget {
  const FrostedGlass({
    super.key,
    required this.child,
    this.blur = 16,
    this.opacity = 0.16,
    this.borderRadius = 24,
    this.boxShadow,
    this.gradient,
  });

  /// 玻璃上的前景内容，不参与背景模糊。
  final Widget child;

  /// 水平和垂直方向的模糊标准差，应大于或等于零。
  final double blur;

  /// 白色叠层的 alpha 值，范围为 0～1，越大越不透明。
  final double opacity;

  /// 玻璃边框和背景模糊区域共同使用的圆角半径。
  final double borderRadius;

  /// 外部阴影，可控制颜色、偏移、模糊和扩散半径；null 或空列表表示无阴影。
  /// 阴影在圆角裁剪区域之外绘制，但仍会受祖先组件的裁剪影响。
  final List<BoxShadow>? boxShadow;

  /// 玻璃表面的渐变，支持线性、径向和扫描渐变；null 表示无渐变。
  /// 渐变绘制在白色叠层之上，透明度由渐变颜色自身的 alpha 控制。
  /// 建议使用半透明颜色，以便透出背景的模糊效果。
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);

    // 阴影放在裁剪层之外，避免被卡片自身的圆角裁掉。
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: radius, boxShadow: boxShadow),
      // 限制滤镜的作用范围，避免背景模糊扩散到卡片之外。
      child: ClipRRect(
        borderRadius: radius,
        // BackdropFilter 处理后方背景，而不是对 child 本身进行模糊。
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: opacity),
              gradient: gradient,
              borderRadius: radius,
              border: Border.all(color: Colors.white.withValues(alpha: 0.28)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
