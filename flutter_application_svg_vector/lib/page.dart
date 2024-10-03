import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class SvgPage extends StatefulWidget {
  const SvgPage({super.key});

  @override
  State<SvgPage> createState() => _SvgPageState();
}

class _SvgPageState extends State<SvgPage> {
  Widget _buildView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('SVG Page'),
          VectorGraphic(
            loader: AssetBytesLoader("assets/svg/security.svg"),
            width: 300,
            height: 300,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SVG Page'),
      ),
      body: _buildView(),
    );
  }
}
