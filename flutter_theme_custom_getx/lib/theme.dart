import 'package:flutter/material.dart';

import 'color_schemes.dart';
import 'string_to_material_color.dart';

class AppTheme {
  static MaterialColor myColor = stringToMaterialColor("008744");

  static ThemeData light = ThemeData(
    colorScheme: lightColorScheme,

    // 自定义主色
    // primarySwatch: Colors.blue,

    // 全局 - 自定义 AppBarTheme
    // appBarTheme: ThemeData.light().appBarTheme.copyWith(
    //       backgroundColor: Colors.yellow,
    //       titleTextStyle: ThemeData.light().textTheme.titleLarge?.copyWith(
    //             color: Colors.black,
    //             fontWeight: FontWeight.bold,
    //             fontSize: 20,
    //           ),
    //     ),
  );

  static ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
  );
}
