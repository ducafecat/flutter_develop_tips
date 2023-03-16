import 'package:flutter/material.dart';

class MyCustomClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // 四个圆角，圆角半径为20
    path.addRRect(RRect.fromLTRBR(
        0, 0, size.width, size.height, const Radius.circular(20)));
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
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/desktop.jpg',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildClipOval() {
    return ClipOval(
      child: Image.asset(
        'assets/desktop.jpg',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildClipPath() {
    return ClipPath(
      clipper: MyCustomClipper1(),
      child: Image.asset(
        'assets/desktop.jpg',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildBoxDecoration() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: AssetImage('assets/desktop.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      width: 100,
      height: 100,
    );
  }

  Widget mainView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildClipRRect(),
          _buildClipOval(),
          _buildClipPath(),
          _buildBoxDecoration(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('圆角图片'),
      ),
      body: mainView(),
    );
  }
}
