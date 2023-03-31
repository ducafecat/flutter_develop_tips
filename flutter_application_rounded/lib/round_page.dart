import 'dart:math';
import 'package:flutter/material.dart';

class StartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = size.width / 2;
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    const angle = 2 * pi / 5;

    path.moveTo(centerX + radius * cos(0), centerY + radius * sin(0));
    for (var i = 1; i < 5; i++) {
      path.lineTo(
        centerX + radius * cos(angle * i),
        centerY + radius * sin(angle * i),
      );
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RoundPage extends StatefulWidget {
  const RoundPage({super.key});

  @override
  State<RoundPage> createState() => _RoundPageState();
}

class _RoundPageState extends State<RoundPage> {
  Widget _buildClipRRect() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: Image.asset(
        'assets/desktop.jpg',
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildClipOval() {
    return ClipOval(
      child: Image.asset(
        'assets/desktop.jpg',
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildBoxDecoration() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        image: DecorationImage(
          image: AssetImage('assets/desktop.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      width: 300,
      height: 300,
    );
  }

  // 错误示范，不能使用Container的decoration属性来设置圆角图片
  Widget _buildBoxDecoration2() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.amber,
        // image: DecorationImage(
        //   image: AssetImage('assets/desktop.jpg'),
        //   fit: BoxFit.cover,
        // ),
      ),
      width: 300,
      height: 300,
      child: Image.asset(
        'assets/desktop.jpg',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildClipPath() {
    return ClipPath(
      clipper: StartClipper(),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/desktop.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        width: 300,
        height: 300,
      ),

      // child: Image.asset(
      //   'assets/desktop.jpg',
      //   width: 300,
      //   height: 300,
      //   fit: BoxFit.cover,
      // ),
    );
  }

  Widget mainView() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            // box
            _buildBoxDecoration2(),
            _buildBoxDecoration(),

            // clip
            _buildClipRRect(),
            _buildClipOval(),

            // path
            _buildClipPath(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('圆角图片'),
      ),
      backgroundColor: Colors.grey,
      body: mainView(),
    );
  }
}
