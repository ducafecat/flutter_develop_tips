import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_gemini/main.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// 图片识别
class VersionPage extends StatefulWidget {
  const VersionPage({super.key});

  @override
  State<VersionPage> createState() => _VersionPageState();
}

class _VersionPageState extends State<VersionPage> {
  final TextEditingController _textController =
      TextEditingController(text: "这两张图片是关于什么内容?");

  /// ai 内容
  String _content = "";

  /// 读取图片
  Future<Uint8List> loadImage(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }

  /// 图片列表
  Widget _buildImagesList() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GridView.extent(
        maxCrossAxisExtent: 150,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: <Widget>[
          Image.asset("assets/images/1.jpg"),
          Image.asset("assets/images/2.jpg"),
        ],
      ),
    );
  }

  /// 图片识别
  Future<String?> _doVisionGeneration(String value) async {
    // 生成模型
    final model = GenerativeModel(
      // 模型名称
      model: 'gemini-pro-vision',
      // API 密钥
      apiKey: MyApp.apiKey,
      // 根据可能的有害性调整您看到回复的可能性。基于内容有害性的概率进行屏蔽。
      safetySettings: [
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.medium), // 骚扰
        SafetySetting(
            HarmCategory.hateSpeech, HarmBlockThreshold.medium), // 仇恨言论
        SafetySetting(
            HarmCategory.sexuallyExplicit, HarmBlockThreshold.medium), // x暗示
        SafetySetting(
            HarmCategory.dangerousContent, HarmBlockThreshold.medium), // 危险内容
      ],
    );

    // 提问词列表
    final (firstImage, secondImage) = await (
      loadImage('assets/images/1.jpg'),
      loadImage('assets/images/2.jpg'),
      // File('assets/images/1.jpg').readAsBytes(),
      // File('assets/images/1.jpg').readAsBytes()
    ).wait;
    final prompt = TextPart(value);
    final imageParts = [
      DataPart('image/jpeg', firstImage),
      DataPart('image/jpeg', secondImage),
    ];
    final response = await model.generateContent([
      Content.multi([prompt, ...imageParts])
    ]);

    // 请求返回
    return response.text;
  }

  Widget _buildView() {
    return Column(
      children: [
        // 输入框
        TextField(
          controller: _textController,
          // maxLines: 2,
          decoration: const InputDecoration(
            labelText: '输入你的提示词',
          ),
        ),

        // 图片列表
        SizedBox(
          height: 160,
          child: _buildImagesList(),
        ),

        // 内容
        Expanded(child: Markdown(data: _content)),
      ],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('图片识别'),
        actions: [
          // 复制
          IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: _content));
            },
            icon: const Icon(Icons.copy),
          ),
          // 提交
          IconButton(
            onPressed: () async {
              var res = await _doVisionGeneration(_textController.text);
              setState(() {
                _content = res ?? "";
              });
            },
            icon: const Icon(Icons.send),
          )
        ],
      ),
      body: _buildView(),
    );
  }
}
