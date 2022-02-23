import 'package:flutter/material.dart';

/// 字符串转颜色 source="FF725C"
Color stringToColor16(String source) {
  // Color(int.parse(source,radix:16)|0xFF000000) //通过位运算符将Alpha设置为FF
  // Color(int.parse(source,radix:16)).withAlpha(255)  //通过方法将Alpha设置为FF
  return Color(int.parse(source, radix: 16) | 0xFF000000);
}
