import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_glass/main.dart';
import 'package:flutter_application_glass/widgets/frosted_glass.dart';

void main() {
  testWidgets('Glass controls update blur and toggle the effect', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    expect(tester.widget<FrostedGlass>(find.byType(FrostedGlass)).blur, 16);

    final slider = tester.widget<Slider>(find.byType(Slider).first);
    slider.onChanged!(28);
    await tester.pump();
    expect(tester.widget<FrostedGlass>(find.byType(FrostedGlass)).blur, 28);

    await tester.ensureVisible(find.byType(Switch));
    await tester.tap(find.byType(Switch));
    await tester.pump();
    final glass = tester.widget<FrostedGlass>(find.byType(FrostedGlass));
    expect(glass.blur, 0);
    expect(glass.opacity, 0);
    expect(tester.widget<Slider>(find.byType(Slider).first).onChanged, isNull);
    expect(tester.takeException(), isNull);
  });
}
