import 'dart:ui';

import 'package:flutter/material.dart';

import 'widgets/frosted_glass.dart';

void main() => runApp(const MyApp());

/// 应用入口，配置深色主题和磨砂效果演示页。
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '图片磨砂',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFFA8D5C0),
        scaffoldBackgroundColor: const Color(0xFF101916),
      ),
      home: const GlassDemoPage(),
    );
  }
}

/// 图片磨砂演示页，支持实时调节模糊程度和玻璃叠层透明度。
class GlassDemoPage extends StatefulWidget {
  const GlassDemoPage({super.key});

  @override
  State<GlassDemoPage> createState() => _GlassDemoPageState();
}

class _GlassDemoPageState extends State<GlassDemoPage> {
  // 高斯模糊的标准差，数值越大，背景越模糊。
  double _blur = 16;
  // 仅作用于底层图片，不会模糊卡片的文字和图标。
  double _imageBlur = 0;
  // 白色玻璃叠层的 alpha 值，越大越不透明。
  double _opacity = 0.16;
  // 阴影和渐变的强度，零表示关闭对应装饰。
  double _shadowStrength = 0.25;
  double _gradientStrength = 0.85;
  // 关闭时暂时移除效果，保留滑块参数便于恢复。
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 28),
                  _buildImagePreview(),
                  const SizedBox(height: 24),
                  _buildControls(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 构建页面标题和效果说明。
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'GLASS / STUDIO',
          style: TextStyle(
            color: Color(0xFFA8D5C0),
            letterSpacing: 4,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          '让风景，多一层朦胧。',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        const Text(
          '图片上的毛玻璃效果，随手调成你喜欢的样子。',
          style: TextStyle(color: Colors.white54, height: 1.6),
        ),
      ],
    );
  }

  /// 构建圆角图片预览，将标签和磨砂卡片叠放在背景图上。
  Widget _buildImagePreview() {
    return AspectRatio(
      aspectRatio: 0.95,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 背景图片和暗色渐变，增强文字可读性。
            _buildImageBackground(),

            // 叠加标签和磨砂卡片，使用 Positioned 控制位置。
            Positioned(
              top: 22,
              left: 22,
              child: Text(
                '01  /  FOREST',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 2,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
            ),

            // 叠加磨砂卡片，使用 Padding 保持内边距。
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: _buildGlassCard(),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建背景：兜底渐变、本地图片和增强文字可读性的暗色渐变。
  Widget _buildImageBackground() {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 兜底渐变，避免图片加载失败时显示纯黑背景。
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFA6C8BB), Color(0xFF44695F), Color(0xFF172F2D)],
            ),
          ),
        ),

        // 只模糊 child 中的图片，不影响其他层的卡片文字和图标。
        ImageFiltered(
          // 总开关开启且模糊值大于零时才启用滤镜，零值时跳过滤镜处理。
          enabled: _enabled && _imageBlur > 0,
          imageFilter: ImageFilter.blur(
            // 水平和垂直方向的高斯模糊标准差，数值越大越模糊。
            sigmaX: _imageBlur,
            sigmaY: _imageBlur,
            // 模糊采样超出图片边界时沿用边缘像素，避免边缘出现透明淡出。
            tileMode: TileMode.clamp,
          ),
          child: Image.asset(
            // 加载 pubspec.yaml 中声明的本地图片资源。
            'assets/images/coffee-cup.jpg',
            // 保持图片比例并铺满容器，超出容器的部分会被裁切。
            fit: BoxFit.cover,
            // 图片加载或解码失败时显示占位图标。
            errorBuilder: (context, error, stackTrace) => const Center(
              child: Icon(
                Icons.landscape_outlined,
                size: 140,
                color: Colors.white24,
              ),
            ),
          ),
        ),

        // 叠加暗色渐变，增强文字可读性。
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Color(0x66000000)],
            ),
          ),
        ),
      ],
    );
  }

  /// 构建磨砂卡片，开关统一控制模糊、叠层、阴影和渐变。
  Widget _buildGlassCard() {
    return FrostedGlass(
      blur: _enabled ? _blur : 0,
      opacity: _enabled ? _opacity : 0,
      boxShadow: _enabled && _shadowStrength > 0
          ? [
              BoxShadow(
                color: Colors.black.withValues(alpha: _shadowStrength),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ]
          : null,
      gradient: _enabled && _gradientStrength > 0
          ? LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white.withValues(alpha: _gradientStrength),
                // 右侧使用暗色，与左侧白色形成明显的水平明暗渐变。
                Colors.black.withValues(alpha: _gradientStrength * 0.7),
              ],
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.spa_outlined, size: 28),
            const SizedBox(height: 20),
            const Text(
              '静听森林',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            const Text(
              '在光与树影之间，留一点时间给自己。',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'EXPLORE THE QUIET',
                  style: TextStyle(fontSize: 9, letterSpacing: 2),
                ),
                Icon(_enabled ? Icons.blur_on : Icons.blur_off, size: 22),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 构建效果开关和滑块，通过 setState 实时更新预览。
  Widget _buildControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                '磨砂效果',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Switch(
              value: _enabled,
              onChanged: (value) => setState(() => _enabled = value),
            ),
          ],
        ),
        _buildSlider(
          '模糊程度',
          '${_blur.round()} px',
          _blur,
          0,
          40,
          (value) => setState(() => _blur = value),
        ),
        _buildSlider(
          '玻璃透明度',
          '${(_opacity * 100).round()}%',
          _opacity,
          0,
          0.6,
          (value) => setState(() => _opacity = value),
        ),
        _buildSlider(
          '阴影强度',
          '${(_shadowStrength * 100).round()}%',
          _shadowStrength,
          0,
          1,
          (value) => setState(() => _shadowStrength = value),
        ),
        _buildSlider(
          '渐变强度',
          '${(_gradientStrength * 100).round()}%',
          _gradientStrength,
          0,
          1,
          (value) => setState(() => _gradientStrength = value),
        ),
        _buildSlider(
          '背景图片模糊',
          '${_imageBlur.round()} px',
          _imageBlur,
          0,
          40,
          (value) => setState(() => _imageBlur = value),
        ),
        const SizedBox(height: 8),
        const Text(
          '拖动滑块实时预览 · 关闭开关对比原图',
          style: TextStyle(fontSize: 11, color: Colors.white38),
        ),
      ],
    );
  }

  /// 构建通用参数滑块；效果关闭时禁用拖动。
  Widget _buildSlider(
    String label,
    String valueLabel,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
            Text(
              valueLabel,
              style: const TextStyle(color: Color(0xFFA8D5C0), fontSize: 12),
            ),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          label: valueLabel,
          onChanged: _enabled ? onChanged : null,
        ),
      ],
    );
  }
}
