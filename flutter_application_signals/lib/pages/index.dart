import 'package:flutter/material.dart';
import 'package:flutter_application_signals/pages/products.dart';

import 'counter.dart';
import 'dashboard.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  Widget _buildView(context) {
    return Column(
      children: [
        ListTile(
          title: const Text("计数器"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CounterPage();
            }));
          },
        ),
        ListTile(
          title: const Text("拉取数据"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ProductsPage();
            }));
          },
        ),
        ListTile(
          title: const Text("面板"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const DashboardPage();
            }));
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter signals 状态管理'),
      ),
      body: _buildView(context),
    );
  }
}
