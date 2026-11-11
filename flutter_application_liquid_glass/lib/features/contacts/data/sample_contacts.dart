import 'package:flutter/material.dart';

import '../models/contact.dart';

List<Contact> sampleContacts() {
  const names = [
    '陈予安',
    '林知夏',
    '王亦舟',
    '张可欣',
    '李明远',
    '赵一诺',
    '周星野',
    '吴思齐',
    '徐清和',
    '孙悦宁',
    '朱景行',
    '胡嘉言',
    '郭沐晴',
    '何书屿',
    '高语桐',
    '罗逸辰',
    '郑向晚',
    '梁初晨',
  ];
  const companies = [
    '拾光设计 · 产品设计师',
    '山海科技 · 前端工程师',
    '云端工作室 · 创意总监',
    '微光文化 · 品牌策划',
    '知行科技 · 产品经理',
    '日常咖啡 · 主理人',
  ];
  const colors = [
    Color(0xFF6679C6),
    Color(0xFFB37FA3),
    Color(0xFF5F9E9A),
    Color(0xFFBF926C),
    Color(0xFF8781B9),
    Color(0xFF729AB8),
  ];
  final now = DateTime.now();
  return List.generate(
    names.length,
    (i) => Contact(
      i,
      names[i],
      companies[i % 6],
      '138 ${(2600 + i * 17).toString().padLeft(4, '0')} ${7800 + i * 13}',
      'contact${i + 1}@example.com',
      colors[i % 6],
      isFavorite: i % 4 == 0,
      lastContact: i % 3 == 0 ? now.subtract(Duration(hours: i + 1)) : null,
    ),
  );
}
