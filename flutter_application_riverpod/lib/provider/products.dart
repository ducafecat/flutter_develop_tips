import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entity/product_entity.dart';

// 1 生成代码的文件
part 'products.g.dart';

// 2 注解方式 异步请求数据并返回
@riverpod
Future<List<ProductEntity>> products(ProductsRef ref) async {
  String url = "https://wpapi.ducafecat.tech/products";
  Response response = await Dio().get(url);

  List<ProductEntity> list = [];
  for (var item in response.data) {
    list.add(ProductEntity.fromJson(item));
  }

  return list;
}
