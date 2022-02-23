import 'package:flutter/material.dart';

import 'index.dart';

class AppTheme {
  // static MaterialColor myColor = stringToColor16("FF725C").materialColor;
  static ThemeData light = ThemeData(
    colorScheme: lightColorScheme,

    // primarySwatch: myColor,
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
