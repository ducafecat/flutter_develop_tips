import 'dart:math';
import 'package:flutter/material.dart';

class GamepadPage extends StatefulWidget {
  const GamepadPage({super.key});

  @override
  State<GamepadPage> createState() => _GamepadPageState();
}

class _GamepadPageState extends State<GamepadPage> {
  double _joystickX = 0.0;
  double _joystickY = 0.0;
  double _angle = 0.0;
  double _distance = 0.0;

  void _updateJoystickValues(
    double x,
    double y,
    double angle,
    double distance,
  ) {
    setState(() {
      _joystickX = x;
      _joystickY = y;
      _angle = angle;
      _distance = distance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('游戏手柄'),
        backgroundColor: Colors.blueGrey[800],
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueGrey[900]!, Colors.grey[800]!],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 摇杆控制区域
            VirtualJoystick(onJoystickChanged: _updateJoystickValues),

            const SizedBox(height: 40),

            // 数值显示区域
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey[600]!, width: 1),
              ),
              child: Column(
                children: [
                  Text(
                    '摇杆数据',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDataDisplay('X轴', _joystickX, Colors.red),
                      _buildDataDisplay('Y轴', _joystickY, Colors.green),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDataDisplay('角度', _angle, Colors.blue),
                      _buildDataDisplay('距离', _distance, Colors.orange),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataDisplay(String label, double value, Color color) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[400])),
        const SizedBox(height: 5),
        Text(
          value.toStringAsFixed(2),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

/// 虚拟摇杆组件
class VirtualJoystick extends StatefulWidget {
  /// 摇杆外圆半径
  final double baseRadius;

  /// 摇杆内圆半径
  final double knobRadius;

  /// 外圆颜色
  final Color baseColor;

  /// 内圆颜色
  final Color knobColor;

  /// 摇杆变化回调
  final Function(double x, double y, double angle, double distance)
  onJoystickChanged;

  const VirtualJoystick({
    super.key,
    this.baseRadius = 80.0,
    this.knobRadius = 30.0,
    this.baseColor = const Color(0xFF2A2A2A),
    this.knobColor = const Color(0xFF5A5A5A),
    required this.onJoystickChanged,
  });

  @override
  State<VirtualJoystick> createState() => _VirtualJoystickState();
}

class _VirtualJoystickState extends State<VirtualJoystick>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  Offset _knobPosition = Offset.zero;
  Offset _centerPoint = Offset.zero;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      _isDragging = true;
    });
    _animationController.stop();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset localPosition = renderBox.globalToLocal(
      details.globalPosition,
    );

    // 计算相对于中心的偏移
    final Offset offset = localPosition - _centerPoint;

    // 限制摇杆在外圆范围内
    final double distance = offset.distance;
    final double maxDistance = widget.baseRadius - widget.knobRadius;

    if (distance <= maxDistance) {
      _knobPosition = offset;
    } else {
      // 限制在边界内
      final double angle = atan2(offset.dy, offset.dx);
      _knobPosition = Offset(
        cos(angle) * maxDistance,
        sin(angle) * maxDistance,
      );
    }

    _updateJoystickValues();
    setState(() {});
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      _isDragging = false;
    });

    // 回弹动画
    _animation = Tween<Offset>(begin: _knobPosition, end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _animationController.reset();
    _animationController.forward().then((_) {
      _knobPosition = Offset.zero;
      _updateJoystickValues();
    });

    _animationController.addListener(() {
      setState(() {
        _knobPosition = _animation.value;
      });
      _updateJoystickValues();
    });
  }

  void _updateJoystickValues() {
    final double maxDistance = widget.baseRadius - widget.knobRadius;
    final double normalizedX = _knobPosition.dx / maxDistance;
    final double normalizedY = -_knobPosition.dy / maxDistance; // Y轴反转，向上为正
    final double angle = atan2(_knobPosition.dy, _knobPosition.dx) * 180 / pi;
    final double distance = _knobPosition.distance / maxDistance;

    widget.onJoystickChanged(normalizedX, normalizedY, angle, distance);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.baseRadius * 2,
      height: widget.baseRadius * 2,
      child: LayoutBuilder(
        builder: (context, constraints) {
          _centerPoint = Offset(
            constraints.maxWidth / 2,
            constraints.maxHeight / 2,
          );

          return GestureDetector(
            onPanStart: _onPanStart,
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            child: CustomPaint(
              painter: JoystickPainter(
                baseRadius: widget.baseRadius,
                knobRadius: widget.knobRadius,
                baseColor: widget.baseColor,
                knobColor: widget.knobColor,
                knobPosition: _knobPosition,
                isDragging: _isDragging,
              ),
              child: Container(),
            ),
          );
        },
      ),
    );
  }
}

/// 摇杆绘制器
class JoystickPainter extends CustomPainter {
  final double baseRadius;
  final double knobRadius;
  final Color baseColor;
  final Color knobColor;
  final Offset knobPosition;
  final bool isDragging;

  JoystickPainter({
    required this.baseRadius,
    required this.knobRadius,
    required this.baseColor,
    required this.knobColor,
    required this.knobPosition,
    required this.isDragging,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);

    // 绘制外圆底座
    _drawBase(canvas, center);

    // 绘制内圆摇杆
    _drawKnob(canvas, center + knobPosition);
  }

  void _drawBase(Canvas canvas, Offset center) {
    // 外圆阴影
    final Paint shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawCircle(center + const Offset(2, 2), baseRadius, shadowPaint);

    // 外圆渐变背景
    final Paint basePaint = Paint()
      ..shader = RadialGradient(
        colors: [
          baseColor.withValues(alpha: 0.8),
          baseColor,
          baseColor.withValues(alpha: 0.6),
        ],
        stops: const [0.0, 0.7, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: baseRadius));
    canvas.drawCircle(center, baseRadius, basePaint);

    // 外圆边框
    final Paint borderPaint = Paint()
      ..color = Colors.grey[600]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, baseRadius, borderPaint);

    // 内部刻度线
    _drawGuidelines(canvas, center);
  }

  void _drawGuidelines(Canvas canvas, Offset center) {
    final Paint linePaint = Paint()
      ..color = Colors.grey[700]!.withValues(alpha: 0.5)
      ..strokeWidth = 1;

    // 绘制十字刻度线
    final double lineLength = baseRadius * 0.6;

    // 水平线
    canvas.drawLine(
      center - Offset(lineLength, 0),
      center + Offset(lineLength, 0),
      linePaint,
    );

    // 垂直线
    canvas.drawLine(
      center - Offset(0, lineLength),
      center + Offset(0, lineLength),
      linePaint,
    );

    // 绘制圆形刻度
    final Paint circlePaint = Paint()
      ..color = Colors.grey[700]!.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawCircle(center, baseRadius * 0.5, circlePaint);
    canvas.drawCircle(center, baseRadius * 0.25, circlePaint);
  }

  void _drawKnob(Canvas canvas, Offset knobCenter) {
    // 摇杆阴影
    final Paint shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.4)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawCircle(knobCenter + const Offset(1, 2), knobRadius, shadowPaint);

    // 摇杆渐变背景
    final Color adjustedKnobColor = isDragging
        ? knobColor.withValues(alpha: 0.9)
        : knobColor;

    final Paint knobPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          adjustedKnobColor.withValues(alpha: 0.9),
          adjustedKnobColor,
          adjustedKnobColor.withValues(alpha: 0.7),
        ],
        stops: const [0.0, 0.6, 1.0],
      ).createShader(Rect.fromCircle(center: knobCenter, radius: knobRadius));
    canvas.drawCircle(knobCenter, knobRadius, knobPaint);

    // 摇杆边框
    final Paint knobBorderPaint = Paint()
      ..color = isDragging ? Colors.grey[400]! : Colors.grey[500]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(knobCenter, knobRadius, knobBorderPaint);

    // 摇杆中心点
    final Paint centerPaint = Paint()
      ..color = Colors.grey[300]!.withValues(alpha: 0.8);
    canvas.drawCircle(knobCenter, 3, centerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
