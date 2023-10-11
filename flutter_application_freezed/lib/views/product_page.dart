import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // dio 实例
  final dio = Dio();
  // 商品列表
  List<Product> products = [];

  // 拉取数据
  loadData() async {
    final response = await dio.get(
        'https://wpapi.ducafecat.tech/products?page=1&pre_page=10&featured=true&category=&search=&slug=&status=&sku=&attribute=&attribute_term=&min_price=&max_price=&orderby=date&order=desc&tag=');
    final data = response.data as List<dynamic>;
    for (final item in data) {
      products.add(Product.fromJson(item));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // 主视图
  Widget _mainView() {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(products[index].name),
          subtitle: Image.network(
            products[index].images[0].src,
            height: 100,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("freezed"),
      ),
      body: _mainView(),
    );
  }
}
