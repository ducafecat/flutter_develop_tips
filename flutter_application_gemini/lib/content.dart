import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_gemini/main.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  final TextEditingController _textController = TextEditingController(
      text: "你现在是论坛水贴王子，请介绍下油管up主猫哥(ducafecat), 他讲 flutter 技术，而且黑暗巫术也很好。");

  /// ai 内容
  String _content = "";

  /// 生成文字内容
  Future<String?> _doContentGeneration(String value) async {
    // 生成模型
    final model = GenerativeModel(
      // 模型名称
      model: 'gemini-pro',
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
    final content = [
      Content.text(value),
    ];

    // 请求返回
    final response = await model.generateContent(content);
    return response.text;
  }

  Widget _buildView() {
    return Column(
      children: [
        // 输入框
        TextField(
          controller: _textController,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: '输入你的提示词',
          ),
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
        title: const Text('内容生成'),
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
              var res = await _doContentGeneration(_textController.text);
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
