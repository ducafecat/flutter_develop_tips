/// 商品查询请求
class ProductsReq {
  /// 页码
  final int? page;

  /// 页尺寸
  final int? prePage;

  /// 推荐
  final bool? featured;

  /// 分类
  final String? category;

  /// 关键词
  final String? search;

  /// slug
  final String? slug;

  /// 标签
  final String? tag;

  /// 状态
  final String? status;

  /// sku
  final String? sku;

  /// 属性
  final String? attribute;

  /// 属性 颜色、尺寸 id
  final String? attributeTerm;

  /// 最小价格
  final String? minPrice;

  /// 最大价格
  final String? maxPrice;

  /// 排序方向 desc asc
  final String? order;

  /// 排序字段
  final String? orderby;

  ProductsReq({
    this.page,
    this.prePage,
    this.featured,
    this.category,
    this.search,
    this.slug,
    this.tag,
    this.status,
    this.sku,
    this.attribute,
    this.attributeTerm,
    this.minPrice,
    this.maxPrice,
    this.order,
    this.orderby,
  });

  Map<String, dynamic> toJson() => {
        'page': page ?? 1,
        'pre_page': prePage ?? 10,
        'featured': featured ?? false,
        'category': category ?? "",
        'search': search ?? "",
        'slug': slug ?? "",
        'tag': tag ?? "",
        'status': status ?? "",
        'sku': sku ?? "",
        'attribute': attribute ?? "",
        'attribute_term': attributeTerm ?? "",
        'min_price': minPrice ?? "",
        'max_price': maxPrice ?? "",
        'orderby': orderby ?? "date",
        'order': order ?? "desc",
      };
}

/// 评论查询请求
class ReviewsReq {
  final int? page;
  final int? prePage;
  final int? product;

  ReviewsReq({
    this.page,
    this.prePage,
    this.product,
  });

  Map<String, dynamic> toJson() => {
        'page': page ?? 1,
        'pre_page': prePage ?? 10,
        'product': product ?? 0,
      };
}

/// tags查询请求
class TagsReq {
  final int? page;
  final int? prePage;
  final String? search;
  final String? slug;

  TagsReq({
    this.page,
    this.prePage,
    this.search,
    this.slug,
  });

  Map<String, dynamic> toJson() => {
        'page': page ?? 1,
        'pre_page': prePage ?? 10,
        'search': search ?? "",
        'slug': slug ?? "",
      };
}
