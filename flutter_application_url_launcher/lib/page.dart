import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 打开网址
  Future<void> onOpenUrl(String url, {LaunchMode? mode}) async {
    Uri uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
    if (!await launchUrl(
      uri,
      mode: mode ?? LaunchMode.platformDefault,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  // 编码查询参数
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  // 发送邮件
  Future<void> onSendMail(String to, String subject, String body) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: to,
      query: encodeQueryParameters(<String, String>{
        'subject': subject,
        'body': body,
      }),
    );
    if (!await canLaunchUrl(uri)) {
      throw Exception('Could not launch $to');
    }
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $to');
    }
  }

  // 发送短信
  Future<void> onSendSMS(String phone, String body) async {
    final Uri uri = Uri(
      scheme: 'sms',
      path: phone,
      queryParameters: <String, String>{
        'body': body,
      },
    );
    if (!await canLaunchUrl(uri)) {
      throw Exception('Could not launch sms $phone');
    }
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch sms $phone');
    }
  }

  // 主视图
  Widget _buildView() {
    return Center(
      child: Column(
        children: [
          // url
          ElevatedButton(
            onPressed: () => onOpenUrl("https://baidu.com"),
            child: const Text('打开 baidu.com'),
          ),

          // url app 内打开
          ElevatedButton(
            onPressed: () => onOpenUrl(
              "https://baidu.com",
              mode: LaunchMode.inAppWebView,
            ),
            child: const Text('APP 内，打开 baidu.com'),
          ),

          // url app 内打开
          ElevatedButton(
            onPressed: () => onOpenUrl(
              "https://baidu.com",
              mode: LaunchMode.externalApplication,
            ),
            child: const Text('外部，打开 baidu.com'),
          ),

          // email
          ElevatedButton(
            onPressed: () => onSendMail("ducafecat@gmail.com", "邮件标题", "邮件正文"),
            child: const Text('发送邮件'),
          ),

          // sms
          ElevatedButton(
            onPressed: () => onSendSMS("+1234567890", "短信正文"),
            child: const Text('发送短信'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('url_launcher'),
      ),
      body: _buildView(),
    );
  }
}
