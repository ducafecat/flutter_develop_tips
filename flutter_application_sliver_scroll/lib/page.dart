import 'dart:math';

import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose(); // 释放内存
    super.dispose();
  }

  Widget _buildPersistentHeader(Widget child,
          {double? minHeight, double? maxHeight}) =>
      SliverPersistentHeader(
          pinned: true,
          delegate: _SliverDelegate(
            minHeight: minHeight ?? 40.0,
            maxHeight: maxHeight ?? 40.0,
            child: child,
          ));

  Widget _mainView() {
    return CustomScrollView(
      slivers: [
        // 横向滚动
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: PageView(
              children: [
                Container(
                  color: Colors.yellow,
                  child: const Center(child: Text('横向滚动')),
                ),
                Container(color: Colors.green),
                Container(color: Colors.blue),
              ],
            ),
          ),
        ),

        // 固定高度内容
        SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: Colors.greenAccent,
            child: const Center(child: Text('固定高度内容')),
          ),
        ),

        // tabView 内容
        SliverToBoxAdapter(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(text: 'Tab 1'),
                    Tab(text: 'Tab 2'),
                    Tab(text: 'Tab 3'),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: TabBarView(
                    children: [
                      Container(color: Colors.yellow),
                      Container(color: Colors.green),
                      Container(color: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // TabBar 固定
        _buildPersistentHeader(TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        )),

        // 固定高度内容
        SliverToBoxAdapter(
          child: Container(
            height: 100,
            color: Colors.greenAccent,
            child: const Center(child: Text('固定高度内容')),
          ),
        ),

        // 子 TabBar 固定
        _buildPersistentHeader(TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'subTab 1'),
            Tab(text: 'subTab 2'),
            Tab(text: 'subTab 3'),
          ],
        )),

        // TabBarView 自适应高度
        SliverFillRemaining(
          child: TabBarView(
            controller: _tabController,
            children: [
              // 第一个选项卡的内容
              ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
              // 第二个选项卡的内容
              ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
              // 第三个选项卡的内容
              ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
            ],
          ),
        ),

        // 固定高度内容
        SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: Colors.greenAccent,
            child: const Center(child: Text('固定高度内容')),
          ),
        ),

        // 列表 100 行
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(title: Text('Item $index'));
            },
            childCount: 100,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sliver Scroll')),
      body: _mainView(),
    );
  }
}

class _SliverDelegate extends SliverPersistentHeaderDelegate {
  _SliverDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight; //最小高度
  final double maxHeight; //最大高度
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override //是否需要重建
  bool shouldRebuild(_SliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
