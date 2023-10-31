import 'package:flutter_application_git_it/common/index.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  ProductListController();

  // 商品列表
  List<ProductModel> products = [];

  _initData() async {
    products = await ProductApi.products(ProductsReq());
    update(["product_list"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
