import 'dart:math';
import 'package:flutter/material.dart';

class GamepadPage extends StatefulWidget {
  const GamepadPage({super.key});

  @override
  State<GamepadPage> createState() => _GamepadPageState();
}

class _GamepadPageState extends State<GamepadPage> {
  // 摇杆的X轴位置值，范围 -1.0 到 1.0
  double joystickX = 0.0;

  // 摇杆的Y轴位置值，范围 -1.0 到 1.0
  double joystickY = 0.0;

  // 摇杆的角度，范围 -180° 到 180°
  double joystickAngle = 0.0;

  // 摇杆距离中心的距离，范围 0.0 到 1.0
  double joystickDistance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('虚拟摇杆')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 虚拟摇杆组件
            VirtualJoystick(
              onChanged: (x, y, angle, distance) {
                setState(() {
                  joystickX = x; // 更新X轴数值
                  joystickY = y; // 更新Y轴数值
                  joystickAngle = angle; // 更新角度数值
                  joystickDistance = distance; // 更新距离数值
                });
              },
            ),

            const SizedBox(height: 40),

            // 数据显示区域
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[400]!),
              ),
              child: Column(
                children: [
                  const Text(
                    '📊 摇杆数据',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // 第一行：X轴和Y轴
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDataItem('🔴 X轴', joystickX, Colors.red),
                      _buildDataItem('🟢 Y轴', joystickY, Colors.green),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // 第二行：角度和距离
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDataItem('🔵 角度', joystickAngle, Colors.blue, '°'),
                      _buildDataItem('🟡 距离', joystickDistance, Colors.orange),
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

  /// 构建数据显示项的辅助方法
  /// [label] 显示的标签文本
  /// [value] 要显示的数值
  /// [color] 数值的颜色
  /// [unit] 可选的单位符号（如 °）
  Widget _buildDataItem(
    String label,
    double value,
    Color color, [
    String unit = '',
  ]) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(height: 5),
        Text(
          '${value.toStringAsFixed(2)}$unit',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

/// 虚拟摇杆组件
/// 这是一个自定义的虚拟摇杆控件，可以检测用户的拖拽手势
/// 并将摇杆的位置转换为游戏中可用的数值
class VirtualJoystick extends StatefulWidget {
  /// 当摇杆位置改变时的回调函数
  /// 参数：x(-1.0到1.0), y(-1.0到1.0), angle(-180到180度), distance(0.0到1.0)
  final Function(double x, double y, double angle, double distance) onChanged;

  /// 摇杆的大小（直径）
  final double size;

  const VirtualJoystick({
    super.key,
    required this.onChanged,
    this.size = 120.0,
  });

  @override
  State<VirtualJoystick> createState() => _VirtualJoystickState();
}

class _VirtualJoystickState extends State<VirtualJoystick> {
  /// 摇杆圆球的当前位置，相对于摇杆中心的偏移量
  /// Offset.zero 表示在正中心
  Offset knobPosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        // 1. 计算摇杆中心点
        final center = widget.size / 2;

        // 2. 获取触摸点相对于摇杆中心的位置
        final position = details.localPosition - Offset(center, center);

        // 3. 计算触摸点到中心的距离
        final distance = position.distance;

        // 4. 设置最大允许距离（摇杆半径减去摇杆球半径）
        final maxDistance = center - 20; // 20是摇杆球的半径

        // 5. 判断是否超出边界
        if (distance <= maxDistance) {
          // 在边界内，直接使用触摸位置
          knobPosition = position;
        } else {
          // 超出边界，将摇杆限制在边界上
          final angle = atan2(position.dy, position.dx);
          knobPosition = Offset(
            cos(angle) * maxDistance, // X坐标
            sin(angle) * maxDistance, // Y坐标
          );
        }

        // 6. 计算各种数值并通知父组件
        _updateValues();
        setState(() {}); // 触发界面重绘
      },
      onPanEnd: (details) {
        // 用户松手时，摇杆自动回弹到中心位置
        setState(() {
          knobPosition = Offset.zero;
        });
        // 通知父组件摇杆已回到中心
        widget.onChanged(0.0, 0.0, 0.0, 0.0);
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        // 摇杆底座的样式
        decoration: BoxDecoration(
          shape: BoxShape.circle, // 圆形
          color: Colors.grey[300], // 浅灰色背景
          border: Border.all(color: Colors.grey[600]!, width: 2), // 深灰色边框
        ),
        child: Stack(
          children: [
            // 摇杆球（可移动的部分）
            Positioned(
              // 计算摇杆球的位置：中心位置 + 偏移量 - 球的半径
              left: (widget.size / 2) + knobPosition.dx - 20,
              top: (widget.size / 2) + knobPosition.dy - 20,
              child: Container(
                width: 40, // 摇杆球直径
                height: 40, // 摇杆球直径
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // 圆形
                  color: Colors.grey[700], // 深灰色
                  border: Border.all(
                    color: Colors.grey[800]!,
                    width: 2,
                  ), // 更深的边框
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 计算并更新摇杆的各种数值
  void _updateValues() {
    final maxDistance = widget.size / 2 - 20; // 最大距离

    // 计算归一化的X和Y值（范围：-1.0 到 1.0）
    final x = knobPosition.dx / maxDistance;
    final y = -knobPosition.dy / maxDistance; // Y轴反转（向上为正）

    // 计算角度（范围：-180° 到 180°）
    final angle = atan2(knobPosition.dy, knobPosition.dx) * 180 / pi;

    // 计算距离（范围：0.0 到 1.0）
    final distance = knobPosition.distance / maxDistance;

    // 通知父组件数值变化
    widget.onChanged(x, y, angle, distance);
  }
}
