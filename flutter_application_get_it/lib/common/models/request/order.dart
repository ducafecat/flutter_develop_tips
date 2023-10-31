/// 订单查询请求
class OrdersReq {
  final int? page;
  final int? prePage;

  OrdersReq({
    this.page,
    this.prePage,
  });

  Map<String, dynamic> toJson() => {
        'page': page ?? 1,
        'pre_page': prePage ?? 10,
      };
}
