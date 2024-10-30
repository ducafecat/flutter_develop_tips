import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '你的应用名称',
      theme: ThemeData(
        primaryColor: const Color(0xFFba7264),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFba7264),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFba7264),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFba7264),
            foregroundColor: Colors.white,
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Colors.grey[200]!,
          selectedColor: const Color(0xFFba7264),
          secondarySelectedColor: const Color(0xFFba7264),
          labelStyle: const TextStyle(color: Colors.black),
          secondaryLabelStyle: const TextStyle(color: Colors.white),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData.dark(),
      // darkTheme: ThemeData.dark().copyWith(
      //   primaryColor: const Color(0xFFba7264),
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Color(0xFFba7264),
      //   ),
      //   colorScheme: ColorScheme.fromSwatch().copyWith(
      //     secondary: const Color(0xFFba7264),
      //   ),
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: const Color(0xFFba7264),
      //       foregroundColor: Colors.white,
      //     ),
      //   ),
      //   chipTheme: ChipThemeData(
      //     backgroundColor: Colors.grey[800]!,
      //     selectedColor: const Color(0xFFba7264),
      //     secondarySelectedColor: const Color(0xFFba7264),
      //     labelStyle: const TextStyle(color: Colors.white),
      //     secondaryLabelStyle: const TextStyle(color: Colors.white),
      //     brightness: Brightness.dark,
      //   ),
      // ),
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(toggleTheme: _toggleTheme),
        '/home': (context) => HomePage(toggleTheme: _toggleTheme),
      },
    );
  }
}
