import '../../global.dart';
import '../index.dart';

/// 商品 api
class ProductApi {
  /// 读取单例 WPHttp
  static final _wpHttp = Global.getIt<WPHttp>();

  /// 分类列表
  static Future<List<CategoryModel>> categories() async {
    var res = await _wpHttp.get(
      '/products/categories',
    );

    List<CategoryModel> categories = [];
    for (var item in res.data) {
      categories.add(CategoryModel.fromJson(item));
    }
    // 排序 menuOrder , 小号在前
    categories.sort((a, b) => a.menuOrder!.compareTo(b.menuOrder as int));
    return categories;
  }

  /// 商品列表
  static Future<List<ProductModel>> products(ProductsReq? req) async {
    var res = await _wpHttp.get(
      '/products',
      params: req?.toJson(),
    );

    List<ProductModel> products = [];
    for (var item in res.data) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }

  /// 商品详情
  static Future<ProductModel> productDetail(int? id) async {
    var res = await _wpHttp.get(
      '/products/$id',
    );
    return ProductModel.fromJson(res.data);
  }

  /// 属性列表
  /// id 1 颜色 2 尺寸
  static Future<List<AttributeModel>> attributes(int id) async {
    var res = await _wpHttp.get(
      '/products/attributes/$id/terms',
    );

    List<AttributeModel> attributes = [];
    for (var item in res.data) {
      attributes.add(AttributeModel.fromJson(item));
    }
    // 排序 menuOrder , 小号在前
    attributes.sort((a, b) => a.menuOrder!.compareTo(b.menuOrder as int));
    return attributes;
  }

  /// 评论列表
  static Future<List<ReviewModel>> reviews(ReviewsReq? req) async {
    var res = await _wpHttp.get(
      '/products/reviews',
      params: req?.toJson(),
    );

    List<ReviewModel> reviews = [];
    for (var item in res.data) {
      reviews.add(ReviewModel.fromJson(item));
    }
    return reviews;
  }

  /// tags 列表
  static Future<List<TagsModel>> tags(TagsReq? req) async {
    var res = await _wpHttp.get(
      '/products/tags',
      params: req?.toJson(),
    );

    List<TagsModel> tags = [];
    for (var item in res.data) {
      tags.add(TagsModel.fromJson(item));
    }
    return tags;
  }
}
