import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../entity/product.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  // 商品列表
  final items = listSignal<ProductEntrty>([]);

  // 拉取数据
  Future fetchData() async {
    String url = "https://wpapi.ducafecat.tech/products";
    Response response = await Dio().get(url);
    List<ProductEntrty> list = [];
    for (var item in response.data) {
      list.add(ProductEntrty.fromJson(item));
    }
    items.value = list;
  }

  Widget _buildView() {
    return ListView.builder(
      itemCount: items.value.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items.value[index].name ?? ""),
          subtitle: Text(items.value[index].description ?? ""),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('拉取数据'),
      ),
      body: Watch.builder(
        builder: (context) => _buildView(),
      ),
    );
  }
}
