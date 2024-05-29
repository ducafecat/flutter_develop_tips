import 'package:flutter/material.dart';
import 'package:flutter_application_dio/apis/product.dart';
import 'package:flutter_application_dio/models/product_model/product_model.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<ProductModel> _products = [];

  void _getProducts() {
    ProductApi.list().then((value) {
      setState(() {
        _products = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  Widget _buildView() {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_products[index].name ?? ""),
          subtitle: Text(_products[index].description ?? ""),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: _buildView(),
    );
  }
}
