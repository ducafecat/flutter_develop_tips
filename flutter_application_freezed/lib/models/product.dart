// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'product.freezed.dart';
part 'product.g.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "slug") required String slug,
    @JsonKey(name: "permalink") required String permalink,
    @JsonKey(name: "date_created") required DateTime dateCreated,
    @JsonKey(name: "date_created_gmt") required DateTime dateCreatedGmt,
    @JsonKey(name: "date_modified") required DateTime dateModified,
    @JsonKey(name: "date_modified_gmt") required DateTime dateModifiedGmt,
    @JsonKey(name: "type") required String type,
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "featured") required bool featured,
    @JsonKey(name: "catalog_visibility") required String catalogVisibility,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "short_description") required String shortDescription,
    @JsonKey(name: "sku") required String sku,
    @JsonKey(name: "price") required String price,
    @JsonKey(name: "regular_price") required String regularPrice,
    @JsonKey(name: "sale_price") required String salePrice,
    @JsonKey(name: "date_on_sale_from") required dynamic dateOnSaleFrom,
    @JsonKey(name: "date_on_sale_from_gmt") required dynamic dateOnSaleFromGmt,
    @JsonKey(name: "date_on_sale_to") required dynamic dateOnSaleTo,
    @JsonKey(name: "date_on_sale_to_gmt") required dynamic dateOnSaleToGmt,
    @JsonKey(name: "on_sale") required bool onSale,
    @JsonKey(name: "purchasable") required bool purchasable,
    @JsonKey(name: "total_sales") required int totalSales,
    @JsonKey(name: "virtual") required bool virtual,
    @JsonKey(name: "downloadable") required bool downloadable,
    @JsonKey(name: "downloads") required List<dynamic> downloads,
    @JsonKey(name: "download_limit") required int downloadLimit,
    @JsonKey(name: "download_expiry") required int downloadExpiry,
    @JsonKey(name: "external_url") required String externalUrl,
    @JsonKey(name: "button_text") required String buttonText,
    @JsonKey(name: "tax_status") required String taxStatus,
    @JsonKey(name: "tax_class") required String taxClass,
    @JsonKey(name: "manage_stock") required bool manageStock,
    @JsonKey(name: "stock_quantity") required dynamic stockQuantity,
    @JsonKey(name: "backorders") required String backorders,
    @JsonKey(name: "backorders_allowed") required bool backordersAllowed,
    @JsonKey(name: "backordered") required bool backordered,
    @JsonKey(name: "low_stock_amount") required dynamic lowStockAmount,
    @JsonKey(name: "sold_individually") required bool soldIndividually,
    @JsonKey(name: "weight") required String weight,
    @JsonKey(name: "dimensions") required Dimensions dimensions,
    @JsonKey(name: "shipping_required") required bool shippingRequired,
    @JsonKey(name: "shipping_taxable") required bool shippingTaxable,
    @JsonKey(name: "shipping_class") required String shippingClass,
    @JsonKey(name: "shipping_class_id") required int shippingClassId,
    @JsonKey(name: "reviews_allowed") required bool reviewsAllowed,
    @JsonKey(name: "average_rating") required String averageRating,
    @JsonKey(name: "rating_count") required int ratingCount,
    @JsonKey(name: "upsell_ids") required List<dynamic> upsellIds,
    @JsonKey(name: "cross_sell_ids") required List<dynamic> crossSellIds,
    @JsonKey(name: "parent_id") required int parentId,
    @JsonKey(name: "purchase_note") required String purchaseNote,
    @JsonKey(name: "categories") required List<Category> categories,
    @JsonKey(name: "tags") required List<Category> tags,
    @JsonKey(name: "images") required List<WooImage> images,
    @JsonKey(name: "attributes") required List<Attribute> attributes,
    @JsonKey(name: "default_attributes")
    required List<dynamic> defaultAttributes,
    @JsonKey(name: "variations") required List<dynamic> variations,
    @JsonKey(name: "grouped_products") required List<dynamic> groupedProducts,
    @JsonKey(name: "menu_order") required int menuOrder,
    @JsonKey(name: "price_html") required String priceHtml,
    @JsonKey(name: "related_ids") required List<int> relatedIds,
    @JsonKey(name: "meta_data") required List<MetaDatum> metaData,
    @JsonKey(name: "stock_status") required String stockStatus,
    @JsonKey(name: "has_options") required bool hasOptions,
    @JsonKey(name: "_links") required Links links,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class Attribute with _$Attribute {
  const factory Attribute({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "position") required int position,
    @JsonKey(name: "visible") required bool visible,
    @JsonKey(name: "variation") required bool variation,
    @JsonKey(name: "options") required List<String> options,
  }) = _Attribute;

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "slug") required String slug,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Dimensions with _$Dimensions {
  const factory Dimensions({
    @JsonKey(name: "length") required String length,
    @JsonKey(name: "width") required String width,
    @JsonKey(name: "height") required String height,
  }) = _Dimensions;

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);
}

@freezed
class WooImage with _$WooImage {
  const factory WooImage({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "date_created") required DateTime dateCreated,
    @JsonKey(name: "date_created_gmt") required DateTime dateCreatedGmt,
    @JsonKey(name: "date_modified") required DateTime dateModified,
    @JsonKey(name: "date_modified_gmt") required DateTime dateModifiedGmt,
    @JsonKey(name: "src") required String src,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "alt") required String alt,
  }) = _WooImage;

  factory WooImage.fromJson(Map<String, dynamic> json) =>
      _$WooImageFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") required List<Collection> self,
    @JsonKey(name: "collection") required List<Collection> collection,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class Collection with _$Collection {
  const factory Collection({
    @JsonKey(name: "href") required String href,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
}

@freezed
class MetaDatum with _$MetaDatum {
  const factory MetaDatum({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "key") required String key,
    @JsonKey(name: "value") required String value,
  }) = _MetaDatum;

  factory MetaDatum.fromJson(Map<String, dynamic> json) =>
      _$MetaDatumFromJson(json);
}
