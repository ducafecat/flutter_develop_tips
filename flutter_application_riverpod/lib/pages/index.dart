import 'package:flutter/material.dart';

import 'network/index.dart';
import 'start/index.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  Widget _buildBtn(BuildContext context, String title, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(title),
    );
  }

  Widget _buildView(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _buildBtn(context, '01 HelloWord', const StartPage()),
          _buildBtn(context, '02 网络请求', const NetworkPage()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod 示例')),
      body: _buildView(context),
    );
  }
}
