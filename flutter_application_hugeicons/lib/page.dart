import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class IconsPage extends StatefulWidget {
  const IconsPage({super.key});

  @override
  State<IconsPage> createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  Widget _mainView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HugeIcon(
            icon: HugeIcons.strokeRoundedWechat,
            color: Colors.red,
            size: 100.0,
          ),
          HugeIcon(
            icon: HugeIcons.strokeRoundedYoutube,
            color: Colors.red,
            size: 100.0,
          ),
          HugeIcon(
            icon: HugeIcons.strokeRoundedAiGame,
            color: Colors.red,
            size: 100.0,
          ),
          HugeIcon(
            icon: HugeIcons.strokeRoundedAiLock,
            color: Colors.red,
            size: 100.0,
          ),
          HugeIcon(
            icon: HugeIcons.strokeRoundedAiInnovation02,
            color: Colors.red,
            size: 100.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hugeicons'),
      ),
      body: _mainView(),
    );
  }
}
