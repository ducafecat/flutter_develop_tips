import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import 'features/contacts/contacts_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => LiquidGlassWidgets.wrap(
    brightnessResolver: Theme.maybeBrightnessOf,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '联系人 · Liquid Glass',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5265D8)),
        fontFamilyFallback: const ['PingFang SC', 'Microsoft YaHei'],
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: const ContactsPage(),
    ),
  );
}
