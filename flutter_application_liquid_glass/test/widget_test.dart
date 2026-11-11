import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_liquid_glass/app.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

Future<void> launch(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('展示联系人并支持姓名、公司和电话搜索及空状态', (tester) async {
    await launch(tester);
    expect(find.text('联系人'), findsOneWidget);
    expect(find.text('18 位朋友'), findsOneWidget);
    expect(find.text('陈予安'), findsOneWidget);
    final input = find.byType(EditableText);
    await tester.enterText(input, '林知夏');
    await tester.pumpAndSettle();
    expect(find.text('林知夏'), findsWidgets);
    expect(find.byKey(const ValueKey('contact-0')), findsNothing);
    await tester.enterText(input, '山海科技');
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('contact-1')), findsOneWidget);
    await tester.enterText(input, '13826007800');
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('contact-0')), findsOneWidget);
    await tester.enterText(input, '不存在');
    await tester.pumpAndSettle();
    expect(find.text('没有找到联系人'), findsOneWidget);
  });

  testWidgets('导航切换、详情、收藏同步和模拟通话', (tester) async {
    await launch(tester);
    final bar = tester.widget<GlassTabBar>(find.byType(GlassTabBar));
    bar.onTabSelected(1);
    await tester.pumpAndSettle();
    expect(find.text('我的收藏'), findsOneWidget);
    expect(find.text('5 位'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('contact-0')));
    await tester.pumpAndSettle();
    expect(find.byType(GlassModalSheet), findsOneWidget);
    expect(find.text('contact1@example.com'), findsOneWidget);
    await tester.ensureVisible(find.text('取消收藏'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('取消收藏'));
    await tester.pumpAndSettle();
    expect(find.text('收藏联系人'), findsOneWidget);
    final closeButton = find.byWidgetPredicate(
      (widget) => widget is GlassButton && widget.label == '关闭',
    );
    await tester.ensureVisible(closeButton);
    await tester.pumpAndSettle();
    await tester.tap(closeButton);
    await tester.pumpAndSettle();
    expect(find.byType(GlassModalSheet), findsNothing);
    expect(find.byKey(const ValueKey('contact-0')), findsNothing);
    expect(find.text('4 位'), findsOneWidget);
    tester.widget<GlassTabBar>(find.byType(GlassTabBar)).onTabSelected(2);
    await tester.pumpAndSettle();
    expect(find.text('最近联系'), findsOneWidget);
    expect(find.text('6 位'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('contact-0')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('拨打电话'));
    await tester.pumpAndSettle();
    expect(find.textContaining('模拟通话'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('小屏底部面板可滚动且支持模拟消息', (tester) async {
    tester.view.physicalSize = const Size(375, 667);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await launch(tester);
    await tester.tap(find.byKey(const ValueKey('contact-0')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('发送消息'));
    await tester.pumpAndSettle();
    expect(find.textContaining('模拟消息'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
