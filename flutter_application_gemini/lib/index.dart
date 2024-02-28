import 'package:flutter/material.dart';
import 'package:flutter_application_gemini/content.dart';

import 'stream.dart';
import 'vision.dart';

class IndexPape extends StatefulWidget {
  const IndexPape({super.key});

  @override
  State<IndexPape> createState() => _IndexPapeState();
}

class _IndexPapeState extends State<IndexPape> {
  Widget _buildItem(String title, {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(fontSize: 18),
        )),
      ),
    );
  }

  Widget _buildView() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GridView.extent(
        maxCrossAxisExtent: 150,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: <Widget>[
          // 1 内容生成
          _buildItem(
            "内容生成",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContentPage()),
            ),
          ),

          // 2 流失内容生成
          _buildItem(
            "流失内容",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StreamPage()),
            ),
          ),

          // 3 图片识别
          _buildItem(
            "图片识别",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VersionPage()),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Gemini AI 水贴王'),
      ),
      body: _buildView(),
    );
  }
}
