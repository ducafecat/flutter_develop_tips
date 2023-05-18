import 'dart:math';

import 'package:flutter/material.dart';

class OverlayUsePage extends StatefulWidget {
  const OverlayUsePage({super.key});

  @override
  State<OverlayUsePage> createState() => _OverlayUsePageState();
}

class _OverlayUsePageState extends State<OverlayUsePage> {
  /// overlay 状态
  OverlayState? overlayState;

  /// overlay 层集合
  List<OverlayEntry> entriesList = [];

  // 随机位置显示层
  void showRandomOverlay(BuildContext context) {
    // 随机颜色
    final bgColor = Color.fromARGB(
      255,
      1 + Random().nextInt(254),
      1 + Random().nextInt(254),
      1 + Random().nextInt(254),
    );

    // 屏幕宽度
    final screenWidth = MediaQuery.of(context).size.width;

    // 随机屏幕高度
    final randomHeight =
        MediaQuery.of(context).size.height * Random().nextDouble();

    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        // 指定位置
        left: 0,
        top: randomHeight,
        child: GestureDetector(
          // 点击删除
          onTap: () {
            overlayEntry?.remove();
            entriesList.remove(overlayEntry);
          },
          // 背景随机色
          child: Container(
            width: screenWidth,
            height: 100,
            color: bgColor,
            child: Center(
              // 提示文字
              child: Text(
                "这是一个 overlay ${Random().nextInt(100)} 层, 点击关闭",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
      );
    });
    overlayState?.insert(overlayEntry);
    entriesList.add(overlayEntry);
  }

  // 控制按钮
  Widget _buildBtns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // 随机新增
        ElevatedButton(
          onPressed: () => showRandomOverlay(context),
          child: const Text("随机新增"),
        ),

        // 关闭所有
        ElevatedButton(
          onPressed: () {
            for (final entry in entriesList) {
              entry.remove();
            }
            entriesList = [];
          },
          child: const Text("关闭所有"),
        ),

        // 随机排序
        ElevatedButton(
          onPressed: () {
            // 从屏幕上移除
            for (final entry in entriesList) {
              entry.remove();
            }

            // 使用Random类创建随机数生成器
            Random random = Random();

            // 使用List的sublist()方法创建一个新列表
            List<OverlayEntry> shuffledEntries = entriesList.sublist(0);

            // 调用List的shuffle()方法，传入一个随机数生成器
            shuffledEntries.shuffle(random);

            // 插入界面
            overlayState?.insertAll(shuffledEntries);
          },
          child: const Text("随机排序"),
        ),
      ],
    );
  }

  // 主视图
  Widget _mainView() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Align(
        alignment: Alignment.topCenter,
        child: _buildBtns(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // 获取 overlay 状态
    overlayState = Overlay.of(context);
  }

  @override
  void dispose() {
    // 销毁
    overlayState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainView(),
    );
  }
}
