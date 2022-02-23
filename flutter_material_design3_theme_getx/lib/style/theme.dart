import 'package:flutter/material.dart';

import 'index.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: lightColorScheme,

    // 全局自定义
    // textTheme: TextTheme(
    //   displayLarge: ThemeData.light().textTheme.displayLarge?.copyWith(
    //         color: Colors.blue,
    //       ),
    // ),

    // 自定义主色
    // primarySwatch: "#B36200".toColor().materialColor,
    // brightness: Brightness.light,

    // seed 快速
    // colorScheme: ColorScheme.fromSeed(
    //   brightness: Brightness.light,
    //   seedColor: stringToColor16("40c254"),
    // ),
    // colorScheme: lightColorScheme,
    // appBarTheme: ThemeData.light().appBarTheme.copyWith(
    //       backgroundColor: myColor,
    //       foregroundColor: Colors.red,
    //     ),
  );

  static ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
  );
}
