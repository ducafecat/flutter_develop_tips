import 'dart:math';

// 随机字符串函数
String generateRandomString() {
  final rnd = Random.secure();
  final length = 8 + rnd.nextInt(5); // 生成 8 到 12 位之间的随机长度
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
    ),
  );
}

// 随机编号函数
String generateRandomNumberString() {
  final rnd = Random.secure();
  final prefix = rnd.nextInt(90) + 10; // 生成 10 到 99 之间的前缀
  final suffix = rnd.nextInt(9000) + 1000; // 生成 1000 到 9999 之间的后缀

  return '$prefix$suffix';
}
