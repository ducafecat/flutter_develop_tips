import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'utils.dart';

class HivePage extends StatefulWidget {
  const HivePage({super.key});

  @override
  State<HivePage> createState() => _HivePageState();
}

class _HivePageState extends State<HivePage> {
  // hive 集合对象
  late Box msgBox;

  // 消息列表
  var _msgList = [];

  // 读取数据
  void _loadData() {
    // 倒序
    _msgList = msgBox.values.toList().reversed.toList();
    if (mounted) {
      setState(() {});
    }
  }

  // 初始化
  Future<void> _init() async {
    msgBox = await Hive.openBox('msgBox');
    _loadData();
  }

  // 模拟接收到一条消息
  Map _recvMsg() {
    var newMsg = {
      "message_id": DateTime.now().millisecondsSinceEpoch.toString(),
      "sender": {
        "user_id": "user${generateRandomNumberString()}",
        "username": generateRandomString(),
        "avatar_url": "https://example.com/avatar.jpg"
      },
      "receiver": {
        "user_id": "user002",
        "username": "Bob",
        "avatar_url": "https://example.com/avatar2.jpg"
      },
      "content": "Hello, how are you?",
      "timestamp": "2023-06-24T10:30:00Z",
      "type": "text",
      "status": "sent",
      "read": false
    };
    return newMsg;
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  Widget _buildBtns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // 新增
        ElevatedButton(
          onPressed: () {
            var msg = _recvMsg();
            msgBox.put(msg["message_id"], msg);
            _loadData();
          },
          child: const Text("新增"),
        ),
        const SizedBox(width: 10),

        // 查询
        ElevatedButton(
          onPressed: () {
            // 查询 user_id 中含有 8 的用户
            _msgList = msgBox.values
                .where((element) =>
                    element["sender"]["user_id"]?.indexOf("8") != -1)
                .toList();
            setState(() {});
          },
          child: const Text("包含 8 字符"),
        ),
        const SizedBox(width: 10),

        // 所有
        ElevatedButton(
          onPressed: () {
            _loadData();
          },
          child: const Text("所有"),
        ),
      ],
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: _msgList.length,
      itemBuilder: (context, index) {
        var msg = _msgList[index];
        return ListTile(
          title: Text(msg["sender"]["user_id"]),
          subtitle: Text(msg["sender"]["username"]),
          // 删除按钮
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              msgBox.delete(msg["message_id"]);
              _loadData();
            },
          ),
        );
      },
    );
  }

  Widget _mainView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // 按钮
          _buildBtns(),

          // 记录数
          Text("记录数: ${_msgList.length}"),

          // 列表
          Expanded(child: _buildList()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Page'),
      ),
      body: _mainView(),
    );
  }
}
