import 'package:flutter_application_dio/models/product_model/product_model.dart';
import 'package:flutter_application_dio/utils/woo_http.dart';

/// 商品 api
class ProductApi {
  /// 商品列表
  static Future<List<ProductModel>> list({int? page, int? prePage}) async {
    var res = await WooHttpUtil().get('/products', params: {
      'page': page ?? 1,
      'per_page': prePage ?? 20,
    });

    List<ProductModel> items = [];
    for (var item in res.data) {
      items.add(ProductModel.fromJson(item));
    }

    return items;
  }
}
