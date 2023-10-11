// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "permalink")
  String get permalink => throw _privateConstructorUsedError;
  @JsonKey(name: "date_created")
  DateTime get dateCreated => throw _privateConstructorUsedError;
  @JsonKey(name: "date_created_gmt")
  DateTime get dateCreatedGmt => throw _privateConstructorUsedError;
  @JsonKey(name: "date_modified")
  DateTime get dateModified => throw _privateConstructorUsedError;
  @JsonKey(name: "date_modified_gmt")
  DateTime get dateModifiedGmt => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "featured")
  bool get featured => throw _privateConstructorUsedError;
  @JsonKey(name: "catalog_visibility")
  String get catalogVisibility => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "short_description")
  String get shortDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "sku")
  String get sku => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: "regular_price")
  String get regularPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "sale_price")
  String get salePrice => throw _privateConstructorUsedError;
  @JsonKey(name: "date_on_sale_from")
  dynamic get dateOnSaleFrom => throw _privateConstructorUsedError;
  @JsonKey(name: "date_on_sale_from_gmt")
  dynamic get dateOnSaleFromGmt => throw _privateConstructorUsedError;
  @JsonKey(name: "date_on_sale_to")
  dynamic get dateOnSaleTo => throw _privateConstructorUsedError;
  @JsonKey(name: "date_on_sale_to_gmt")
  dynamic get dateOnSaleToGmt => throw _privateConstructorUsedError;
  @JsonKey(name: "on_sale")
  bool get onSale => throw _privateConstructorUsedError;
  @JsonKey(name: "purchasable")
  bool get purchasable => throw _privateConstructorUsedError;
  @JsonKey(name: "total_sales")
  int get totalSales => throw _privateConstructorUsedError;
  @JsonKey(name: "virtual")
  bool get virtual => throw _privateConstructorUsedError;
  @JsonKey(name: "downloadable")
  bool get downloadable => throw _privateConstructorUsedError;
  @JsonKey(name: "downloads")
  List<dynamic> get downloads => throw _privateConstructorUsedError;
  @JsonKey(name: "download_limit")
  int get downloadLimit => throw _privateConstructorUsedError;
  @JsonKey(name: "download_expiry")
  int get downloadExpiry => throw _privateConstructorUsedError;
  @JsonKey(name: "external_url")
  String get externalUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "button_text")
  String get buttonText => throw _privateConstructorUsedError;
  @JsonKey(name: "tax_status")
  String get taxStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "tax_class")
  String get taxClass => throw _privateConstructorUsedError;
  @JsonKey(name: "manage_stock")
  bool get manageStock => throw _privateConstructorUsedError;
  @JsonKey(name: "stock_quantity")
  dynamic get stockQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: "backorders")
  String get backorders => throw _privateConstructorUsedError;
  @JsonKey(name: "backorders_allowed")
  bool get backordersAllowed => throw _privateConstructorUsedError;
  @JsonKey(name: "backordered")
  bool get backordered => throw _privateConstructorUsedError;
  @JsonKey(name: "low_stock_amount")
  dynamic get lowStockAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "sold_individually")
  bool get soldIndividually => throw _privateConstructorUsedError;
  @JsonKey(name: "weight")
  String get weight => throw _privateConstructorUsedError;
  @JsonKey(name: "dimensions")
  Dimensions get dimensions => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_required")
  bool get shippingRequired => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_taxable")
  bool get shippingTaxable => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_class")
  String get shippingClass => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_class_id")
  int get shippingClassId => throw _privateConstructorUsedError;
  @JsonKey(name: "reviews_allowed")
  bool get reviewsAllowed => throw _privateConstructorUsedError;
  @JsonKey(name: "average_rating")
  String get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: "rating_count")
  int get ratingCount => throw _privateConstructorUsedError;
  @JsonKey(name: "upsell_ids")
  List<dynamic> get upsellIds => throw _privateConstructorUsedError;
  @JsonKey(name: "cross_sell_ids")
  List<dynamic> get crossSellIds => throw _privateConstructorUsedError;
  @JsonKey(name: "parent_id")
  int get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: "purchase_note")
  String get purchaseNote => throw _privateConstructorUsedError;
  @JsonKey(name: "categories")
  List<Category> get categories => throw _privateConstructorUsedError;
  @JsonKey(name: "tags")
  List<Category> get tags => throw _privateConstructorUsedError;
  @JsonKey(name: "images")
  List<WooImage> get images => throw _privateConstructorUsedError;
  @JsonKey(name: "attributes")
  List<Attribute> get attributes => throw _privateConstructorUsedError;
  @JsonKey(name: "default_attributes")
  List<dynamic> get defaultAttributes => throw _privateConstructorUsedError;
  @JsonKey(name: "variations")
  List<dynamic> get variations => throw _privateConstructorUsedError;
  @JsonKey(name: "grouped_products")
  List<dynamic> get groupedProducts => throw _privateConstructorUsedError;
  @JsonKey(name: "menu_order")
  int get menuOrder => throw _privateConstructorUsedError;
  @JsonKey(name: "price_html")
  String get priceHtml => throw _privateConstructorUsedError;
  @JsonKey(name: "related_ids")
  List<int> get relatedIds => throw _privateConstructorUsedError;
  @JsonKey(name: "meta_data")
  List<MetaDatum> get metaData => throw _privateConstructorUsedError;
  @JsonKey(name: "stock_status")
  String get stockStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "has_options")
  bool get hasOptions => throw _privateConstructorUsedError;
  @JsonKey(name: "_links")
  Links get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "slug") String slug,
      @JsonKey(name: "permalink") String permalink,
      @JsonKey(name: "date_created") DateTime dateCreated,
      @JsonKey(name: "date_created_gmt") DateTime dateCreatedGmt,
      @JsonKey(name: "date_modified") DateTime dateModified,
      @JsonKey(name: "date_modified_gmt") DateTime dateModifiedGmt,
      @JsonKey(name: "type") String type,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "featured") bool featured,
      @JsonKey(name: "catalog_visibility") String catalogVisibility,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "short_description") String shortDescription,
      @JsonKey(name: "sku") String sku,
      @JsonKey(name: "price") String price,
      @JsonKey(name: "regular_price") String regularPrice,
      @JsonKey(name: "sale_price") String salePrice,
      @JsonKey(name: "date_on_sale_from") dynamic dateOnSaleFrom,
      @JsonKey(name: "date_on_sale_from_gmt") dynamic dateOnSaleFromGmt,
      @JsonKey(name: "date_on_sale_to") dynamic dateOnSaleTo,
      @JsonKey(name: "date_on_sale_to_gmt") dynamic dateOnSaleToGmt,
      @JsonKey(name: "on_sale") bool onSale,
      @JsonKey(name: "purchasable") bool purchasable,
      @JsonKey(name: "total_sales") int totalSales,
      @JsonKey(name: "virtual") bool virtual,
      @JsonKey(name: "downloadable") bool downloadable,
      @JsonKey(name: "downloads") List<dynamic> downloads,
      @JsonKey(name: "download_limit") int downloadLimit,
      @JsonKey(name: "download_expiry") int downloadExpiry,
      @JsonKey(name: "external_url") String externalUrl,
      @JsonKey(name: "button_text") String buttonText,
      @JsonKey(name: "tax_status") String taxStatus,
      @JsonKey(name: "tax_class") String taxClass,
      @JsonKey(name: "manage_stock") bool manageStock,
      @JsonKey(name: "stock_quantity") dynamic stockQuantity,
      @JsonKey(name: "backorders") String backorders,
      @JsonKey(name: "backorders_allowed") bool backordersAllowed,
      @JsonKey(name: "backordered") bool backordered,
      @JsonKey(name: "low_stock_amount") dynamic lowStockAmount,
      @JsonKey(name: "sold_individually") bool soldIndividually,
      @JsonKey(name: "weight") String weight,
      @JsonKey(name: "dimensions") Dimensions dimensions,
      @JsonKey(name: "shipping_required") bool shippingRequired,
      @JsonKey(name: "shipping_taxable") bool shippingTaxable,
      @JsonKey(name: "shipping_class") String shippingClass,
      @JsonKey(name: "shipping_class_id") int shippingClassId,
      @JsonKey(name: "reviews_allowed") bool reviewsAllowed,
      @JsonKey(name: "average_rating") String averageRating,
      @JsonKey(name: "rating_count") int ratingCount,
      @JsonKey(name: "upsell_ids") List<dynamic> upsellIds,
      @JsonKey(name: "cross_sell_ids") List<dynamic> crossSellIds,
      @JsonKey(name: "parent_id") int parentId,
      @JsonKey(name: "purchase_note") String purchaseNote,
      @JsonKey(name: "categories") List<Category> categories,
      @JsonKey(name: "tags") List<Category> tags,
      @JsonKey(name: "images") List<WooImage> images,
      @JsonKey(name: "attributes") List<Attribute> attributes,
      @JsonKey(name: "default_attributes") List<dynamic> defaultAttributes,
      @JsonKey(name: "variations") List<dynamic> variations,
      @JsonKey(name: "grouped_products") List<dynamic> groupedProducts,
      @JsonKey(name: "menu_order") int menuOrder,
      @JsonKey(name: "price_html") String priceHtml,
      @JsonKey(name: "related_ids") List<int> relatedIds,
      @JsonKey(name: "meta_data") List<MetaDatum> metaData,
      @JsonKey(name: "stock_status") String stockStatus,
      @JsonKey(name: "has_options") bool hasOptions,
      @JsonKey(name: "_links") Links links});

  $DimensionsCopyWith<$Res> get dimensions;
  $LinksCopyWith<$Res> get links;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? permalink = null,
    Object? dateCreated = null,
    Object? dateCreatedGmt = null,
    Object? dateModified = null,
    Object? dateModifiedGmt = null,
    Object? type = null,
    Object? status = null,
    Object? featured = null,
    Object? catalogVisibility = null,
    Object? description = null,
    Object? shortDescription = null,
    Object? sku = null,
    Object? price = null,
    Object? regularPrice = null,
    Object? salePrice = null,
    Object? dateOnSaleFrom = freezed,
    Object? dateOnSaleFromGmt = freezed,
    Object? dateOnSaleTo = freezed,
    Object? dateOnSaleToGmt = freezed,
    Object? onSale = null,
    Object? purchasable = null,
    Object? totalSales = null,
    Object? virtual = null,
    Object? downloadable = null,
    Object? downloads = null,
    Object? downloadLimit = null,
    Object? downloadExpiry = null,
    Object? externalUrl = null,
    Object? buttonText = null,
    Object? taxStatus = null,
    Object? taxClass = null,
    Object? manageStock = null,
    Object? stockQuantity = freezed,
    Object? backorders = null,
    Object? backordersAllowed = null,
    Object? backordered = null,
    Object? lowStockAmount = freezed,
    Object? soldIndividually = null,
    Object? weight = null,
    Object? dimensions = null,
    Object? shippingRequired = null,
    Object? shippingTaxable = null,
    Object? shippingClass = null,
    Object? shippingClassId = null,
    Object? reviewsAllowed = null,
    Object? averageRating = null,
    Object? ratingCount = null,
    Object? upsellIds = null,
    Object? crossSellIds = null,
    Object? parentId = null,
    Object? purchaseNote = null,
    Object? categories = null,
    Object? tags = null,
    Object? images = null,
    Object? attributes = null,
    Object? defaultAttributes = null,
    Object? variations = null,
    Object? groupedProducts = null,
    Object? menuOrder = null,
    Object? priceHtml = null,
    Object? relatedIds = null,
    Object? metaData = null,
    Object? stockStatus = null,
    Object? hasOptions = null,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      permalink: null == permalink
          ? _value.permalink
          : permalink // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateCreatedGmt: null == dateCreatedGmt
          ? _value.dateCreatedGmt
          : dateCreatedGmt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModifiedGmt: null == dateModifiedGmt
          ? _value.dateModifiedGmt
          : dateModifiedGmt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      catalogVisibility: null == catalogVisibility
          ? _value.catalogVisibility
          : catalogVisibility // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      regularPrice: null == regularPrice
          ? _value.regularPrice
          : regularPrice // ignore: cast_nullable_to_non_nullable
              as String,
      salePrice: null == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as String,
      dateOnSaleFrom: freezed == dateOnSaleFrom
          ? _value.dateOnSaleFrom
          : dateOnSaleFrom // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateOnSaleFromGmt: freezed == dateOnSaleFromGmt
          ? _value.dateOnSaleFromGmt
          : dateOnSaleFromGmt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateOnSaleTo: freezed == dateOnSaleTo
          ? _value.dateOnSaleTo
          : dateOnSaleTo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateOnSaleToGmt: freezed == dateOnSaleToGmt
          ? _value.dateOnSaleToGmt
          : dateOnSaleToGmt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      onSale: null == onSale
          ? _value.onSale
          : onSale // ignore: cast_nullable_to_non_nullable
              as bool,
      purchasable: null == purchasable
          ? _value.purchasable
          : purchasable // ignore: cast_nullable_to_non_nullable
              as bool,
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int,
      virtual: null == virtual
          ? _value.virtual
          : virtual // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadable: null == downloadable
          ? _value.downloadable
          : downloadable // ignore: cast_nullable_to_non_nullable
              as bool,
      downloads: null == downloads
          ? _value.downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      downloadLimit: null == downloadLimit
          ? _value.downloadLimit
          : downloadLimit // ignore: cast_nullable_to_non_nullable
              as int,
      downloadExpiry: null == downloadExpiry
          ? _value.downloadExpiry
          : downloadExpiry // ignore: cast_nullable_to_non_nullable
              as int,
      externalUrl: null == externalUrl
          ? _value.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String,
      buttonText: null == buttonText
          ? _value.buttonText
          : buttonText // ignore: cast_nullable_to_non_nullable
              as String,
      taxStatus: null == taxStatus
          ? _value.taxStatus
          : taxStatus // ignore: cast_nullable_to_non_nullable
              as String,
      taxClass: null == taxClass
          ? _value.taxClass
          : taxClass // ignore: cast_nullable_to_non_nullable
              as String,
      manageStock: null == manageStock
          ? _value.manageStock
          : manageStock // ignore: cast_nullable_to_non_nullable
              as bool,
      stockQuantity: freezed == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      backorders: null == backorders
          ? _value.backorders
          : backorders // ignore: cast_nullable_to_non_nullable
              as String,
      backordersAllowed: null == backordersAllowed
          ? _value.backordersAllowed
          : backordersAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      backordered: null == backordered
          ? _value.backordered
          : backordered // ignore: cast_nullable_to_non_nullable
              as bool,
      lowStockAmount: freezed == lowStockAmount
          ? _value.lowStockAmount
          : lowStockAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      soldIndividually: null == soldIndividually
          ? _value.soldIndividually
          : soldIndividually // ignore: cast_nullable_to_non_nullable
              as bool,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      dimensions: null == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as Dimensions,
      shippingRequired: null == shippingRequired
          ? _value.shippingRequired
          : shippingRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      shippingTaxable: null == shippingTaxable
          ? _value.shippingTaxable
          : shippingTaxable // ignore: cast_nullable_to_non_nullable
              as bool,
      shippingClass: null == shippingClass
          ? _value.shippingClass
          : shippingClass // ignore: cast_nullable_to_non_nullable
              as String,
      shippingClassId: null == shippingClassId
          ? _value.shippingClassId
          : shippingClassId // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsAllowed: null == reviewsAllowed
          ? _value.reviewsAllowed
          : reviewsAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as String,
      ratingCount: null == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int,
      upsellIds: null == upsellIds
          ? _value.upsellIds
          : upsellIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      crossSellIds: null == crossSellIds
          ? _value.crossSellIds
          : crossSellIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseNote: null == purchaseNote
          ? _value.purchaseNote
          : purchaseNote // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<WooImage>,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<Attribute>,
      defaultAttributes: null == defaultAttributes
          ? _value.defaultAttributes
          : defaultAttributes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      variations: null == variations
          ? _value.variations
          : variations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      groupedProducts: null == groupedProducts
          ? _value.groupedProducts
          : groupedProducts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      menuOrder: null == menuOrder
          ? _value.menuOrder
          : menuOrder // ignore: cast_nullable_to_non_nullable
              as int,
      priceHtml: null == priceHtml
          ? _value.priceHtml
          : priceHtml // ignore: cast_nullable_to_non_nullable
              as String,
      relatedIds: null == relatedIds
          ? _value.relatedIds
          : relatedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      metaData: null == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as List<MetaDatum>,
      stockStatus: null == stockStatus
          ? _value.stockStatus
          : stockStatus // ignore: cast_nullable_to_non_nullable
              as String,
      hasOptions: null == hasOptions
          ? _value.hasOptions
          : hasOptions // ignore: cast_nullable_to_non_nullable
              as bool,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DimensionsCopyWith<$Res> get dimensions {
    return $DimensionsCopyWith<$Res>(_value.dimensions, (value) {
      return _then(_value.copyWith(dimensions: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res> get links {
    return $LinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "slug") String slug,
      @JsonKey(name: "permalink") String permalink,
      @JsonKey(name: "date_created") DateTime dateCreated,
      @JsonKey(name: "date_created_gmt") DateTime dateCreatedGmt,
      @JsonKey(name: "date_modified") DateTime dateModified,
      @JsonKey(name: "date_modified_gmt") DateTime dateModifiedGmt,
      @JsonKey(name: "type") String type,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "featured") bool featured,
      @JsonKey(name: "catalog_visibility") String catalogVisibility,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "short_description") String shortDescription,
      @JsonKey(name: "sku") String sku,
      @JsonKey(name: "price") String price,
      @JsonKey(name: "regular_price") String regularPrice,
      @JsonKey(name: "sale_price") String salePrice,
      @JsonKey(name: "date_on_sale_from") dynamic dateOnSaleFrom,
      @JsonKey(name: "date_on_sale_from_gmt") dynamic dateOnSaleFromGmt,
      @JsonKey(name: "date_on_sale_to") dynamic dateOnSaleTo,
      @JsonKey(name: "date_on_sale_to_gmt") dynamic dateOnSaleToGmt,
      @JsonKey(name: "on_sale") bool onSale,
      @JsonKey(name: "purchasable") bool purchasable,
      @JsonKey(name: "total_sales") int totalSales,
      @JsonKey(name: "virtual") bool virtual,
      @JsonKey(name: "downloadable") bool downloadable,
      @JsonKey(name: "downloads") List<dynamic> downloads,
      @JsonKey(name: "download_limit") int downloadLimit,
      @JsonKey(name: "download_expiry") int downloadExpiry,
      @JsonKey(name: "external_url") String externalUrl,
      @JsonKey(name: "button_text") String buttonText,
      @JsonKey(name: "tax_status") String taxStatus,
      @JsonKey(name: "tax_class") String taxClass,
      @JsonKey(name: "manage_stock") bool manageStock,
      @JsonKey(name: "stock_quantity") dynamic stockQuantity,
      @JsonKey(name: "backorders") String backorders,
      @JsonKey(name: "backorders_allowed") bool backordersAllowed,
      @JsonKey(name: "backordered") bool backordered,
      @JsonKey(name: "low_stock_amount") dynamic lowStockAmount,
      @JsonKey(name: "sold_individually") bool soldIndividually,
      @JsonKey(name: "weight") String weight,
      @JsonKey(name: "dimensions") Dimensions dimensions,
      @JsonKey(name: "shipping_required") bool shippingRequired,
      @JsonKey(name: "shipping_taxable") bool shippingTaxable,
      @JsonKey(name: "shipping_class") String shippingClass,
      @JsonKey(name: "shipping_class_id") int shippingClassId,
      @JsonKey(name: "reviews_allowed") bool reviewsAllowed,
      @JsonKey(name: "average_rating") String averageRating,
      @JsonKey(name: "rating_count") int ratingCount,
      @JsonKey(name: "upsell_ids") List<dynamic> upsellIds,
      @JsonKey(name: "cross_sell_ids") List<dynamic> crossSellIds,
      @JsonKey(name: "parent_id") int parentId,
      @JsonKey(name: "purchase_note") String purchaseNote,
      @JsonKey(name: "categories") List<Category> categories,
      @JsonKey(name: "tags") List<Category> tags,
      @JsonKey(name: "images") List<WooImage> images,
      @JsonKey(name: "attributes") List<Attribute> attributes,
      @JsonKey(name: "default_attributes") List<dynamic> defaultAttributes,
      @JsonKey(name: "variations") List<dynamic> variations,
      @JsonKey(name: "grouped_products") List<dynamic> groupedProducts,
      @JsonKey(name: "menu_order") int menuOrder,
      @JsonKey(name: "price_html") String priceHtml,
      @JsonKey(name: "related_ids") List<int> relatedIds,
      @JsonKey(name: "meta_data") List<MetaDatum> metaData,
      @JsonKey(name: "stock_status") String stockStatus,
      @JsonKey(name: "has_options") bool hasOptions,
      @JsonKey(name: "_links") Links links});

  @override
  $DimensionsCopyWith<$Res> get dimensions;
  @override
  $LinksCopyWith<$Res> get links;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? permalink = null,
    Object? dateCreated = null,
    Object? dateCreatedGmt = null,
    Object? dateModified = null,
    Object? dateModifiedGmt = null,
    Object? type = null,
    Object? status = null,
    Object? featured = null,
    Object? catalogVisibility = null,
    Object? description = null,
    Object? shortDescription = null,
    Object? sku = null,
    Object? price = null,
    Object? regularPrice = null,
    Object? salePrice = null,
    Object? dateOnSaleFrom = freezed,
    Object? dateOnSaleFromGmt = freezed,
    Object? dateOnSaleTo = freezed,
    Object? dateOnSaleToGmt = freezed,
    Object? onSale = null,
    Object? purchasable = null,
    Object? totalSales = null,
    Object? virtual = null,
    Object? downloadable = null,
    Object? downloads = null,
    Object? downloadLimit = null,
    Object? downloadExpiry = null,
    Object? externalUrl = null,
    Object? buttonText = null,
    Object? taxStatus = null,
    Object? taxClass = null,
    Object? manageStock = null,
    Object? stockQuantity = freezed,
    Object? backorders = null,
    Object? backordersAllowed = null,
    Object? backordered = null,
    Object? lowStockAmount = freezed,
    Object? soldIndividually = null,
    Object? weight = null,
    Object? dimensions = null,
    Object? shippingRequired = null,
    Object? shippingTaxable = null,
    Object? shippingClass = null,
    Object? shippingClassId = null,
    Object? reviewsAllowed = null,
    Object? averageRating = null,
    Object? ratingCount = null,
    Object? upsellIds = null,
    Object? crossSellIds = null,
    Object? parentId = null,
    Object? purchaseNote = null,
    Object? categories = null,
    Object? tags = null,
    Object? images = null,
    Object? attributes = null,
    Object? defaultAttributes = null,
    Object? variations = null,
    Object? groupedProducts = null,
    Object? menuOrder = null,
    Object? priceHtml = null,
    Object? relatedIds = null,
    Object? metaData = null,
    Object? stockStatus = null,
    Object? hasOptions = null,
    Object? links = null,
  }) {
    return _then(_$ProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      permalink: null == permalink
          ? _value.permalink
          : permalink // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateCreatedGmt: null == dateCreatedGmt
          ? _value.dateCreatedGmt
          : dateCreatedGmt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModifiedGmt: null == dateModifiedGmt
          ? _value.dateModifiedGmt
          : dateModifiedGmt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      catalogVisibility: null == catalogVisibility
          ? _value.catalogVisibility
          : catalogVisibility // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      regularPrice: null == regularPrice
          ? _value.regularPrice
          : regularPrice // ignore: cast_nullable_to_non_nullable
              as String,
      salePrice: null == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as String,
      dateOnSaleFrom: freezed == dateOnSaleFrom
          ? _value.dateOnSaleFrom
          : dateOnSaleFrom // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateOnSaleFromGmt: freezed == dateOnSaleFromGmt
          ? _value.dateOnSaleFromGmt
          : dateOnSaleFromGmt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateOnSaleTo: freezed == dateOnSaleTo
          ? _value.dateOnSaleTo
          : dateOnSaleTo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateOnSaleToGmt: freezed == dateOnSaleToGmt
          ? _value.dateOnSaleToGmt
          : dateOnSaleToGmt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      onSale: null == onSale
          ? _value.onSale
          : onSale // ignore: cast_nullable_to_non_nullable
              as bool,
      purchasable: null == purchasable
          ? _value.purchasable
          : purchasable // ignore: cast_nullable_to_non_nullable
              as bool,
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int,
      virtual: null == virtual
          ? _value.virtual
          : virtual // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadable: null == downloadable
          ? _value.downloadable
          : downloadable // ignore: cast_nullable_to_non_nullable
              as bool,
      downloads: null == downloads
          ? _value._downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      downloadLimit: null == downloadLimit
          ? _value.downloadLimit
          : downloadLimit // ignore: cast_nullable_to_non_nullable
              as int,
      downloadExpiry: null == downloadExpiry
          ? _value.downloadExpiry
          : downloadExpiry // ignore: cast_nullable_to_non_nullable
              as int,
      externalUrl: null == externalUrl
          ? _value.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String,
      buttonText: null == buttonText
          ? _value.buttonText
          : buttonText // ignore: cast_nullable_to_non_nullable
              as String,
      taxStatus: null == taxStatus
          ? _value.taxStatus
          : taxStatus // ignore: cast_nullable_to_non_nullable
              as String,
      taxClass: null == taxClass
          ? _value.taxClass
          : taxClass // ignore: cast_nullable_to_non_nullable
              as String,
      manageStock: null == manageStock
          ? _value.manageStock
          : manageStock // ignore: cast_nullable_to_non_nullable
              as bool,
      stockQuantity: freezed == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      backorders: null == backorders
          ? _value.backorders
          : backorders // ignore: cast_nullable_to_non_nullable
              as String,
      backordersAllowed: null == backordersAllowed
          ? _value.backordersAllowed
          : backordersAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      backordered: null == backordered
          ? _value.backordered
          : backordered // ignore: cast_nullable_to_non_nullable
              as bool,
      lowStockAmount: freezed == lowStockAmount
          ? _value.lowStockAmount
          : lowStockAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      soldIndividually: null == soldIndividually
          ? _value.soldIndividually
          : soldIndividually // ignore: cast_nullable_to_non_nullable
              as bool,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      dimensions: null == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as Dimensions,
      shippingRequired: null == shippingRequired
          ? _value.shippingRequired
          : shippingRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      shippingTaxable: null == shippingTaxable
          ? _value.shippingTaxable
          : shippingTaxable // ignore: cast_nullable_to_non_nullable
              as bool,
      shippingClass: null == shippingClass
          ? _value.shippingClass
          : shippingClass // ignore: cast_nullable_to_non_nullable
              as String,
      shippingClassId: null == shippingClassId
          ? _value.shippingClassId
          : shippingClassId // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsAllowed: null == reviewsAllowed
          ? _value.reviewsAllowed
          : reviewsAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as String,
      ratingCount: null == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int,
      upsellIds: null == upsellIds
          ? _value._upsellIds
          : upsellIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      crossSellIds: null == crossSellIds
          ? _value._crossSellIds
          : crossSellIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseNote: null == purchaseNote
          ? _value.purchaseNote
          : purchaseNote // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<WooImage>,
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<Attribute>,
      defaultAttributes: null == defaultAttributes
          ? _value._defaultAttributes
          : defaultAttributes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      variations: null == variations
          ? _value._variations
          : variations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      groupedProducts: null == groupedProducts
          ? _value._groupedProducts
          : groupedProducts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      menuOrder: null == menuOrder
          ? _value.menuOrder
          : menuOrder // ignore: cast_nullable_to_non_nullable
              as int,
      priceHtml: null == priceHtml
          ? _value.priceHtml
          : priceHtml // ignore: cast_nullable_to_non_nullable
              as String,
      relatedIds: null == relatedIds
          ? _value._relatedIds
          : relatedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      metaData: null == metaData
          ? _value._metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as List<MetaDatum>,
      stockStatus: null == stockStatus
          ? _value.stockStatus
          : stockStatus // ignore: cast_nullable_to_non_nullable
              as String,
      hasOptions: null == hasOptions
          ? _value.hasOptions
          : hasOptions // ignore: cast_nullable_to_non_nullable
              as bool,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "slug") required this.slug,
      @JsonKey(name: "permalink") required this.permalink,
      @JsonKey(name: "date_created") required this.dateCreated,
      @JsonKey(name: "date_created_gmt") required this.dateCreatedGmt,
      @JsonKey(name: "date_modified") required this.dateModified,
      @JsonKey(name: "date_modified_gmt") required this.dateModifiedGmt,
      @JsonKey(name: "type") required this.type,
      @JsonKey(name: "status") required this.status,
      @JsonKey(name: "featured") required this.featured,
      @JsonKey(name: "catalog_visibility") required this.catalogVisibility,
      @JsonKey(name: "description") required this.description,
      @JsonKey(name: "short_description") required this.shortDescription,
      @JsonKey(name: "sku") required this.sku,
      @JsonKey(name: "price") required this.price,
      @JsonKey(name: "regular_price") required this.regularPrice,
      @JsonKey(name: "sale_price") required this.salePrice,
      @JsonKey(name: "date_on_sale_from") required this.dateOnSaleFrom,
      @JsonKey(name: "date_on_sale_from_gmt") required this.dateOnSaleFromGmt,
      @JsonKey(name: "date_on_sale_to") required this.dateOnSaleTo,
      @JsonKey(name: "date_on_sale_to_gmt") required this.dateOnSaleToGmt,
      @JsonKey(name: "on_sale") required this.onSale,
      @JsonKey(name: "purchasable") required this.purchasable,
      @JsonKey(name: "total_sales") required this.totalSales,
      @JsonKey(name: "virtual") required this.virtual,
      @JsonKey(name: "downloadable") required this.downloadable,
      @JsonKey(name: "downloads") required final List<dynamic> downloads,
      @JsonKey(name: "download_limit") required this.downloadLimit,
      @JsonKey(name: "download_expiry") required this.downloadExpiry,
      @JsonKey(name: "external_url") required this.externalUrl,
      @JsonKey(name: "button_text") required this.buttonText,
      @JsonKey(name: "tax_status") required this.taxStatus,
      @JsonKey(name: "tax_class") required this.taxClass,
      @JsonKey(name: "manage_stock") required this.manageStock,
      @JsonKey(name: "stock_quantity") required this.stockQuantity,
      @JsonKey(name: "backorders") required this.backorders,
      @JsonKey(name: "backorders_allowed") required this.backordersAllowed,
      @JsonKey(name: "backordered") required this.backordered,
      @JsonKey(name: "low_stock_amount") required this.lowStockAmount,
      @JsonKey(name: "sold_individually") required this.soldIndividually,
      @JsonKey(name: "weight") required this.weight,
      @JsonKey(name: "dimensions") required this.dimensions,
      @JsonKey(name: "shipping_required") required this.shippingRequired,
      @JsonKey(name: "shipping_taxable") required this.shippingTaxable,
      @JsonKey(name: "shipping_class") required this.shippingClass,
      @JsonKey(name: "shipping_class_id") required this.shippingClassId,
      @JsonKey(name: "reviews_allowed") required this.reviewsAllowed,
      @JsonKey(name: "average_rating") required this.averageRating,
      @JsonKey(name: "rating_count") required this.ratingCount,
      @JsonKey(name: "upsell_ids") required final List<dynamic> upsellIds,
      @JsonKey(name: "cross_sell_ids")
      required final List<dynamic> crossSellIds,
      @JsonKey(name: "parent_id") required this.parentId,
      @JsonKey(name: "purchase_note") required this.purchaseNote,
      @JsonKey(name: "categories") required final List<Category> categories,
      @JsonKey(name: "tags") required final List<Category> tags,
      @JsonKey(name: "images") required final List<WooImage> images,
      @JsonKey(name: "attributes") required final List<Attribute> attributes,
      @JsonKey(name: "default_attributes")
      required final List<dynamic> defaultAttributes,
      @JsonKey(name: "variations") required final List<dynamic> variations,
      @JsonKey(name: "grouped_products")
      required final List<dynamic> groupedProducts,
      @JsonKey(name: "menu_order") required this.menuOrder,
      @JsonKey(name: "price_html") required this.priceHtml,
      @JsonKey(name: "related_ids") required final List<int> relatedIds,
      @JsonKey(name: "meta_data") required final List<MetaDatum> metaData,
      @JsonKey(name: "stock_status") required this.stockStatus,
      @JsonKey(name: "has_options") required this.hasOptions,
      @JsonKey(name: "_links") required this.links})
      : _downloads = downloads,
        _upsellIds = upsellIds,
        _crossSellIds = crossSellIds,
        _categories = categories,
        _tags = tags,
        _images = images,
        _attributes = attributes,
        _defaultAttributes = defaultAttributes,
        _variations = variations,
        _groupedProducts = groupedProducts,
        _relatedIds = relatedIds,
        _metaData = metaData;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "slug")
  final String slug;
  @override
  @JsonKey(name: "permalink")
  final String permalink;
  @override
  @JsonKey(name: "date_created")
  final DateTime dateCreated;
  @override
  @JsonKey(name: "date_created_gmt")
  final DateTime dateCreatedGmt;
  @override
  @JsonKey(name: "date_modified")
  final DateTime dateModified;
  @override
  @JsonKey(name: "date_modified_gmt")
  final DateTime dateModifiedGmt;
  @override
  @JsonKey(name: "type")
  final String type;
  @override
  @JsonKey(name: "status")
  final String status;
  @override
  @JsonKey(name: "featured")
  final bool featured;
  @override
  @JsonKey(name: "catalog_visibility")
  final String catalogVisibility;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "short_description")
  final String shortDescription;
  @override
  @JsonKey(name: "sku")
  final String sku;
  @override
  @JsonKey(name: "price")
  final String price;
  @override
  @JsonKey(name: "regular_price")
  final String regularPrice;
  @override
  @JsonKey(name: "sale_price")
  final String salePrice;
  @override
  @JsonKey(name: "date_on_sale_from")
  final dynamic dateOnSaleFrom;
  @override
  @JsonKey(name: "date_on_sale_from_gmt")
  final dynamic dateOnSaleFromGmt;
  @override
  @JsonKey(name: "date_on_sale_to")
  final dynamic dateOnSaleTo;
  @override
  @JsonKey(name: "date_on_sale_to_gmt")
  final dynamic dateOnSaleToGmt;
  @override
  @JsonKey(name: "on_sale")
  final bool onSale;
  @override
  @JsonKey(name: "purchasable")
  final bool purchasable;
  @override
  @JsonKey(name: "total_sales")
  final int totalSales;
  @override
  @JsonKey(name: "virtual")
  final bool virtual;
  @override
  @JsonKey(name: "downloadable")
  final bool downloadable;
  final List<dynamic> _downloads;
  @override
  @JsonKey(name: "downloads")
  List<dynamic> get downloads {
    if (_downloads is EqualUnmodifiableListView) return _downloads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downloads);
  }

  @override
  @JsonKey(name: "download_limit")
  final int downloadLimit;
  @override
  @JsonKey(name: "download_expiry")
  final int downloadExpiry;
  @override
  @JsonKey(name: "external_url")
  final String externalUrl;
  @override
  @JsonKey(name: "button_text")
  final String buttonText;
  @override
  @JsonKey(name: "tax_status")
  final String taxStatus;
  @override
  @JsonKey(name: "tax_class")
  final String taxClass;
  @override
  @JsonKey(name: "manage_stock")
  final bool manageStock;
  @override
  @JsonKey(name: "stock_quantity")
  final dynamic stockQuantity;
  @override
  @JsonKey(name: "backorders")
  final String backorders;
  @override
  @JsonKey(name: "backorders_allowed")
  final bool backordersAllowed;
  @override
  @JsonKey(name: "backordered")
  final bool backordered;
  @override
  @JsonKey(name: "low_stock_amount")
  final dynamic lowStockAmount;
  @override
  @JsonKey(name: "sold_individually")
  final bool soldIndividually;
  @override
  @JsonKey(name: "weight")
  final String weight;
  @override
  @JsonKey(name: "dimensions")
  final Dimensions dimensions;
  @override
  @JsonKey(name: "shipping_required")
  final bool shippingRequired;
  @override
  @JsonKey(name: "shipping_taxable")
  final bool shippingTaxable;
  @override
  @JsonKey(name: "shipping_class")
  final String shippingClass;
  @override
  @JsonKey(name: "shipping_class_id")
  final int shippingClassId;
  @override
  @JsonKey(name: "reviews_allowed")
  final bool reviewsAllowed;
  @override
  @JsonKey(name: "average_rating")
  final String averageRating;
  @override
  @JsonKey(name: "rating_count")
  final int ratingCount;
  final List<dynamic> _upsellIds;
  @override
  @JsonKey(name: "upsell_ids")
  List<dynamic> get upsellIds {
    if (_upsellIds is EqualUnmodifiableListView) return _upsellIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upsellIds);
  }

  final List<dynamic> _crossSellIds;
  @override
  @JsonKey(name: "cross_sell_ids")
  List<dynamic> get crossSellIds {
    if (_crossSellIds is EqualUnmodifiableListView) return _crossSellIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_crossSellIds);
  }

  @override
  @JsonKey(name: "parent_id")
  final int parentId;
  @override
  @JsonKey(name: "purchase_note")
  final String purchaseNote;
  final List<Category> _categories;
  @override
  @JsonKey(name: "categories")
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Category> _tags;
  @override
  @JsonKey(name: "tags")
  List<Category> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<WooImage> _images;
  @override
  @JsonKey(name: "images")
  List<WooImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<Attribute> _attributes;
  @override
  @JsonKey(name: "attributes")
  List<Attribute> get attributes {
    if (_attributes is EqualUnmodifiableListView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributes);
  }

  final List<dynamic> _defaultAttributes;
  @override
  @JsonKey(name: "default_attributes")
  List<dynamic> get defaultAttributes {
    if (_defaultAttributes is EqualUnmodifiableListView)
      return _defaultAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_defaultAttributes);
  }

  final List<dynamic> _variations;
  @override
  @JsonKey(name: "variations")
  List<dynamic> get variations {
    if (_variations is EqualUnmodifiableListView) return _variations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variations);
  }

  final List<dynamic> _groupedProducts;
  @override
  @JsonKey(name: "grouped_products")
  List<dynamic> get groupedProducts {
    if (_groupedProducts is EqualUnmodifiableListView) return _groupedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupedProducts);
  }

  @override
  @JsonKey(name: "menu_order")
  final int menuOrder;
  @override
  @JsonKey(name: "price_html")
  final String priceHtml;
  final List<int> _relatedIds;
  @override
  @JsonKey(name: "related_ids")
  List<int> get relatedIds {
    if (_relatedIds is EqualUnmodifiableListView) return _relatedIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedIds);
  }

  final List<MetaDatum> _metaData;
  @override
  @JsonKey(name: "meta_data")
  List<MetaDatum> get metaData {
    if (_metaData is EqualUnmodifiableListView) return _metaData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metaData);
  }

  @override
  @JsonKey(name: "stock_status")
  final String stockStatus;
  @override
  @JsonKey(name: "has_options")
  final bool hasOptions;
  @override
  @JsonKey(name: "_links")
  final Links links;

  @override
  String toString() {
    return 'Product(id: $id, name: $name, slug: $slug, permalink: $permalink, dateCreated: $dateCreated, dateCreatedGmt: $dateCreatedGmt, dateModified: $dateModified, dateModifiedGmt: $dateModifiedGmt, type: $type, status: $status, featured: $featured, catalogVisibility: $catalogVisibility, description: $description, shortDescription: $shortDescription, sku: $sku, price: $price, regularPrice: $regularPrice, salePrice: $salePrice, dateOnSaleFrom: $dateOnSaleFrom, dateOnSaleFromGmt: $dateOnSaleFromGmt, dateOnSaleTo: $dateOnSaleTo, dateOnSaleToGmt: $dateOnSaleToGmt, onSale: $onSale, purchasable: $purchasable, totalSales: $totalSales, virtual: $virtual, downloadable: $downloadable, downloads: $downloads, downloadLimit: $downloadLimit, downloadExpiry: $downloadExpiry, externalUrl: $externalUrl, buttonText: $buttonText, taxStatus: $taxStatus, taxClass: $taxClass, manageStock: $manageStock, stockQuantity: $stockQuantity, backorders: $backorders, backordersAllowed: $backordersAllowed, backordered: $backordered, lowStockAmount: $lowStockAmount, soldIndividually: $soldIndividually, weight: $weight, dimensions: $dimensions, shippingRequired: $shippingRequired, shippingTaxable: $shippingTaxable, shippingClass: $shippingClass, shippingClassId: $shippingClassId, reviewsAllowed: $reviewsAllowed, averageRating: $averageRating, ratingCount: $ratingCount, upsellIds: $upsellIds, crossSellIds: $crossSellIds, parentId: $parentId, purchaseNote: $purchaseNote, categories: $categories, tags: $tags, images: $images, attributes: $attributes, defaultAttributes: $defaultAttributes, variations: $variations, groupedProducts: $groupedProducts, menuOrder: $menuOrder, priceHtml: $priceHtml, relatedIds: $relatedIds, metaData: $metaData, stockStatus: $stockStatus, hasOptions: $hasOptions, links: $links)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.permalink, permalink) ||
                other.permalink == permalink) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.dateCreatedGmt, dateCreatedGmt) ||
                other.dateCreatedGmt == dateCreatedGmt) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified) &&
            (identical(other.dateModifiedGmt, dateModifiedGmt) ||
                other.dateModifiedGmt == dateModifiedGmt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.catalogVisibility, catalogVisibility) ||
                other.catalogVisibility == catalogVisibility) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.regularPrice, regularPrice) ||
                other.regularPrice == regularPrice) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            const DeepCollectionEquality()
                .equals(other.dateOnSaleFrom, dateOnSaleFrom) &&
            const DeepCollectionEquality()
                .equals(other.dateOnSaleFromGmt, dateOnSaleFromGmt) &&
            const DeepCollectionEquality()
                .equals(other.dateOnSaleTo, dateOnSaleTo) &&
            const DeepCollectionEquality()
                .equals(other.dateOnSaleToGmt, dateOnSaleToGmt) &&
            (identical(other.onSale, onSale) || other.onSale == onSale) &&
            (identical(other.purchasable, purchasable) ||
                other.purchasable == purchasable) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.virtual, virtual) || other.virtual == virtual) &&
            (identical(other.downloadable, downloadable) ||
                other.downloadable == downloadable) &&
            const DeepCollectionEquality()
                .equals(other._downloads, _downloads) &&
            (identical(other.downloadLimit, downloadLimit) ||
                other.downloadLimit == downloadLimit) &&
            (identical(other.downloadExpiry, downloadExpiry) ||
                other.downloadExpiry == downloadExpiry) &&
            (identical(other.externalUrl, externalUrl) ||
                other.externalUrl == externalUrl) &&
            (identical(other.buttonText, buttonText) ||
                other.buttonText == buttonText) &&
            (identical(other.taxStatus, taxStatus) ||
                other.taxStatus == taxStatus) &&
            (identical(other.taxClass, taxClass) ||
                other.taxClass == taxClass) &&
            (identical(other.manageStock, manageStock) ||
                other.manageStock == manageStock) &&
            const DeepCollectionEquality()
                .equals(other.stockQuantity, stockQuantity) &&
            (identical(other.backorders, backorders) ||
                other.backorders == backorders) &&
            (identical(other.backordersAllowed, backordersAllowed) ||
                other.backordersAllowed == backordersAllowed) &&
            (identical(other.backordered, backordered) ||
                other.backordered == backordered) &&
            const DeepCollectionEquality()
                .equals(other.lowStockAmount, lowStockAmount) &&
            (identical(other.soldIndividually, soldIndividually) ||
                other.soldIndividually == soldIndividually) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.dimensions, dimensions) ||
                other.dimensions == dimensions) &&
            (identical(other.shippingRequired, shippingRequired) ||
                other.shippingRequired == shippingRequired) &&
            (identical(other.shippingTaxable, shippingTaxable) ||
                other.shippingTaxable == shippingTaxable) &&
            (identical(other.shippingClass, shippingClass) ||
                other.shippingClass == shippingClass) &&
            (identical(other.shippingClassId, shippingClassId) ||
                other.shippingClassId == shippingClassId) &&
            (identical(other.reviewsAllowed, reviewsAllowed) ||
                other.reviewsAllowed == reviewsAllowed) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount) &&
            const DeepCollectionEquality()
                .equals(other._upsellIds, _upsellIds) &&
            const DeepCollectionEquality()
                .equals(other._crossSellIds, _crossSellIds) &&
            (identical(other.parentId, parentId) || other.parentId == parentId) &&
            (identical(other.purchaseNote, purchaseNote) || other.purchaseNote == purchaseNote) &&
            const DeepCollectionEquality().equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._attributes, _attributes) &&
            const DeepCollectionEquality().equals(other._defaultAttributes, _defaultAttributes) &&
            const DeepCollectionEquality().equals(other._variations, _variations) &&
            const DeepCollectionEquality().equals(other._groupedProducts, _groupedProducts) &&
            (identical(other.menuOrder, menuOrder) || other.menuOrder == menuOrder) &&
            (identical(other.priceHtml, priceHtml) || other.priceHtml == priceHtml) &&
            const DeepCollectionEquality().equals(other._relatedIds, _relatedIds) &&
            const DeepCollectionEquality().equals(other._metaData, _metaData) &&
            (identical(other.stockStatus, stockStatus) || other.stockStatus == stockStatus) &&
            (identical(other.hasOptions, hasOptions) || other.hasOptions == hasOptions) &&
            (identical(other.links, links) || other.links == links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        slug,
        permalink,
        dateCreated,
        dateCreatedGmt,
        dateModified,
        dateModifiedGmt,
        type,
        status,
        featured,
        catalogVisibility,
        description,
        shortDescription,
        sku,
        price,
        regularPrice,
        salePrice,
        const DeepCollectionEquality().hash(dateOnSaleFrom),
        const DeepCollectionEquality().hash(dateOnSaleFromGmt),
        const DeepCollectionEquality().hash(dateOnSaleTo),
        const DeepCollectionEquality().hash(dateOnSaleToGmt),
        onSale,
        purchasable,
        totalSales,
        virtual,
        downloadable,
        const DeepCollectionEquality().hash(_downloads),
        downloadLimit,
        downloadExpiry,
        externalUrl,
        buttonText,
        taxStatus,
        taxClass,
        manageStock,
        const DeepCollectionEquality().hash(stockQuantity),
        backorders,
        backordersAllowed,
        backordered,
        const DeepCollectionEquality().hash(lowStockAmount),
        soldIndividually,
        weight,
        dimensions,
        shippingRequired,
        shippingTaxable,
        shippingClass,
        shippingClassId,
        reviewsAllowed,
        averageRating,
        ratingCount,
        const DeepCollectionEquality().hash(_upsellIds),
        const DeepCollectionEquality().hash(_crossSellIds),
        parentId,
        purchaseNote,
        const DeepCollectionEquality().hash(_categories),
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_attributes),
        const DeepCollectionEquality().hash(_defaultAttributes),
        const DeepCollectionEquality().hash(_variations),
        const DeepCollectionEquality().hash(_groupedProducts),
        menuOrder,
        priceHtml,
        const DeepCollectionEquality().hash(_relatedIds),
        const DeepCollectionEquality().hash(_metaData),
        stockStatus,
        hasOptions,
        links
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "slug") required final String slug,
      @JsonKey(name: "permalink") required final String permalink,
      @JsonKey(name: "date_created") required final DateTime dateCreated,
      @JsonKey(name: "date_created_gmt") required final DateTime dateCreatedGmt,
      @JsonKey(name: "date_modified") required final DateTime dateModified,
      @JsonKey(name: "date_modified_gmt")
      required final DateTime dateModifiedGmt,
      @JsonKey(name: "type") required final String type,
      @JsonKey(name: "status") required final String status,
      @JsonKey(name: "featured") required final bool featured,
      @JsonKey(name: "catalog_visibility")
      required final String catalogVisibility,
      @JsonKey(name: "description") required final String description,
      @JsonKey(name: "short_description")
      required final String shortDescription,
      @JsonKey(name: "sku") required final String sku,
      @JsonKey(name: "price") required final String price,
      @JsonKey(name: "regular_price") required final String regularPrice,
      @JsonKey(name: "sale_price") required final String salePrice,
      @JsonKey(name: "date_on_sale_from") required final dynamic dateOnSaleFrom,
      @JsonKey(name: "date_on_sale_from_gmt")
      required final dynamic dateOnSaleFromGmt,
      @JsonKey(name: "date_on_sale_to") required final dynamic dateOnSaleTo,
      @JsonKey(name: "date_on_sale_to_gmt")
      required final dynamic dateOnSaleToGmt,
      @JsonKey(name: "on_sale") required final bool onSale,
      @JsonKey(name: "purchasable") required final bool purchasable,
      @JsonKey(name: "total_sales") required final int totalSales,
      @JsonKey(name: "virtual") required final bool virtual,
      @JsonKey(name: "downloadable") required final bool downloadable,
      @JsonKey(name: "downloads") required final List<dynamic> downloads,
      @JsonKey(name: "download_limit") required final int downloadLimit,
      @JsonKey(name: "download_expiry") required final int downloadExpiry,
      @JsonKey(name: "external_url") required final String externalUrl,
      @JsonKey(name: "button_text") required final String buttonText,
      @JsonKey(name: "tax_status") required final String taxStatus,
      @JsonKey(name: "tax_class") required final String taxClass,
      @JsonKey(name: "manage_stock") required final bool manageStock,
      @JsonKey(name: "stock_quantity") required final dynamic stockQuantity,
      @JsonKey(name: "backorders") required final String backorders,
      @JsonKey(name: "backorders_allowed")
      required final bool backordersAllowed,
      @JsonKey(name: "backordered") required final bool backordered,
      @JsonKey(name: "low_stock_amount") required final dynamic lowStockAmount,
      @JsonKey(name: "sold_individually") required final bool soldIndividually,
      @JsonKey(name: "weight") required final String weight,
      @JsonKey(name: "dimensions") required final Dimensions dimensions,
      @JsonKey(name: "shipping_required") required final bool shippingRequired,
      @JsonKey(name: "shipping_taxable") required final bool shippingTaxable,
      @JsonKey(name: "shipping_class") required final String shippingClass,
      @JsonKey(name: "shipping_class_id") required final int shippingClassId,
      @JsonKey(name: "reviews_allowed") required final bool reviewsAllowed,
      @JsonKey(name: "average_rating") required final String averageRating,
      @JsonKey(name: "rating_count") required final int ratingCount,
      @JsonKey(name: "upsell_ids") required final List<dynamic> upsellIds,
      @JsonKey(name: "cross_sell_ids")
      required final List<dynamic> crossSellIds,
      @JsonKey(name: "parent_id") required final int parentId,
      @JsonKey(name: "purchase_note") required final String purchaseNote,
      @JsonKey(name: "categories") required final List<Category> categories,
      @JsonKey(name: "tags") required final List<Category> tags,
      @JsonKey(name: "images") required final List<WooImage> images,
      @JsonKey(name: "attributes") required final List<Attribute> attributes,
      @JsonKey(name: "default_attributes")
      required final List<dynamic> defaultAttributes,
      @JsonKey(name: "variations") required final List<dynamic> variations,
      @JsonKey(name: "grouped_products")
      required final List<dynamic> groupedProducts,
      @JsonKey(name: "menu_order") required final int menuOrder,
      @JsonKey(name: "price_html") required final String priceHtml,
      @JsonKey(name: "related_ids") required final List<int> relatedIds,
      @JsonKey(name: "meta_data") required final List<MetaDatum> metaData,
      @JsonKey(name: "stock_status") required final String stockStatus,
      @JsonKey(name: "has_options") required final bool hasOptions,
      @JsonKey(name: "_links") required final Links links}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "slug")
  String get slug;
  @override
  @JsonKey(name: "permalink")
  String get permalink;
  @override
  @JsonKey(name: "date_created")
  DateTime get dateCreated;
  @override
  @JsonKey(name: "date_created_gmt")
  DateTime get dateCreatedGmt;
  @override
  @JsonKey(name: "date_modified")
  DateTime get dateModified;
  @override
  @JsonKey(name: "date_modified_gmt")
  DateTime get dateModifiedGmt;
  @override
  @JsonKey(name: "type")
  String get type;
  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "featured")
  bool get featured;
  @override
  @JsonKey(name: "catalog_visibility")
  String get catalogVisibility;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "short_description")
  String get shortDescription;
  @override
  @JsonKey(name: "sku")
  String get sku;
  @override
  @JsonKey(name: "price")
  String get price;
  @override
  @JsonKey(name: "regular_price")
  String get regularPrice;
  @override
  @JsonKey(name: "sale_price")
  String get salePrice;
  @override
  @JsonKey(name: "date_on_sale_from")
  dynamic get dateOnSaleFrom;
  @override
  @JsonKey(name: "date_on_sale_from_gmt")
  dynamic get dateOnSaleFromGmt;
  @override
  @JsonKey(name: "date_on_sale_to")
  dynamic get dateOnSaleTo;
  @override
  @JsonKey(name: "date_on_sale_to_gmt")
  dynamic get dateOnSaleToGmt;
  @override
  @JsonKey(name: "on_sale")
  bool get onSale;
  @override
  @JsonKey(name: "purchasable")
  bool get purchasable;
  @override
  @JsonKey(name: "total_sales")
  int get totalSales;
  @override
  @JsonKey(name: "virtual")
  bool get virtual;
  @override
  @JsonKey(name: "downloadable")
  bool get downloadable;
  @override
  @JsonKey(name: "downloads")
  List<dynamic> get downloads;
  @override
  @JsonKey(name: "download_limit")
  int get downloadLimit;
  @override
  @JsonKey(name: "download_expiry")
  int get downloadExpiry;
  @override
  @JsonKey(name: "external_url")
  String get externalUrl;
  @override
  @JsonKey(name: "button_text")
  String get buttonText;
  @override
  @JsonKey(name: "tax_status")
  String get taxStatus;
  @override
  @JsonKey(name: "tax_class")
  String get taxClass;
  @override
  @JsonKey(name: "manage_stock")
  bool get manageStock;
  @override
  @JsonKey(name: "stock_quantity")
  dynamic get stockQuantity;
  @override
  @JsonKey(name: "backorders")
  String get backorders;
  @override
  @JsonKey(name: "backorders_allowed")
  bool get backordersAllowed;
  @override
  @JsonKey(name: "backordered")
  bool get backordered;
  @override
  @JsonKey(name: "low_stock_amount")
  dynamic get lowStockAmount;
  @override
  @JsonKey(name: "sold_individually")
  bool get soldIndividually;
  @override
  @JsonKey(name: "weight")
  String get weight;
  @override
  @JsonKey(name: "dimensions")
  Dimensions get dimensions;
  @override
  @JsonKey(name: "shipping_required")
  bool get shippingRequired;
  @override
  @JsonKey(name: "shipping_taxable")
  bool get shippingTaxable;
  @override
  @JsonKey(name: "shipping_class")
  String get shippingClass;
  @override
  @JsonKey(name: "shipping_class_id")
  int get shippingClassId;
  @override
  @JsonKey(name: "reviews_allowed")
  bool get reviewsAllowed;
  @override
  @JsonKey(name: "average_rating")
  String get averageRating;
  @override
  @JsonKey(name: "rating_count")
  int get ratingCount;
  @override
  @JsonKey(name: "upsell_ids")
  List<dynamic> get upsellIds;
  @override
  @JsonKey(name: "cross_sell_ids")
  List<dynamic> get crossSellIds;
  @override
  @JsonKey(name: "parent_id")
  int get parentId;
  @override
  @JsonKey(name: "purchase_note")
  String get purchaseNote;
  @override
  @JsonKey(name: "categories")
  List<Category> get categories;
  @override
  @JsonKey(name: "tags")
  List<Category> get tags;
  @override
  @JsonKey(name: "images")
  List<WooImage> get images;
  @override
  @JsonKey(name: "attributes")
  List<Attribute> get attributes;
  @override
  @JsonKey(name: "default_attributes")
  List<dynamic> get defaultAttributes;
  @override
  @JsonKey(name: "variations")
  List<dynamic> get variations;
  @override
  @JsonKey(name: "grouped_products")
  List<dynamic> get groupedProducts;
  @override
  @JsonKey(name: "menu_order")
  int get menuOrder;
  @override
  @JsonKey(name: "price_html")
  String get priceHtml;
  @override
  @JsonKey(name: "related_ids")
  List<int> get relatedIds;
  @override
  @JsonKey(name: "meta_data")
  List<MetaDatum> get metaData;
  @override
  @JsonKey(name: "stock_status")
  String get stockStatus;
  @override
  @JsonKey(name: "has_options")
  bool get hasOptions;
  @override
  @JsonKey(name: "_links")
  Links get links;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return _Attribute.fromJson(json);
}

/// @nodoc
mixin _$Attribute {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "position")
  int get position => throw _privateConstructorUsedError;
  @JsonKey(name: "visible")
  bool get visible => throw _privateConstructorUsedError;
  @JsonKey(name: "variation")
  bool get variation => throw _privateConstructorUsedError;
  @JsonKey(name: "options")
  List<String> get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttributeCopyWith<Attribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributeCopyWith<$Res> {
  factory $AttributeCopyWith(Attribute value, $Res Function(Attribute) then) =
      _$AttributeCopyWithImpl<$Res, Attribute>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "position") int position,
      @JsonKey(name: "visible") bool visible,
      @JsonKey(name: "variation") bool variation,
      @JsonKey(name: "options") List<String> options});
}

/// @nodoc
class _$AttributeCopyWithImpl<$Res, $Val extends Attribute>
    implements $AttributeCopyWith<$Res> {
  _$AttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? position = null,
    Object? visible = null,
    Object? variation = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      visible: null == visible
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
      variation: null == variation
          ? _value.variation
          : variation // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttributeImplCopyWith<$Res>
    implements $AttributeCopyWith<$Res> {
  factory _$$AttributeImplCopyWith(
          _$AttributeImpl value, $Res Function(_$AttributeImpl) then) =
      __$$AttributeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "position") int position,
      @JsonKey(name: "visible") bool visible,
      @JsonKey(name: "variation") bool variation,
      @JsonKey(name: "options") List<String> options});
}

/// @nodoc
class __$$AttributeImplCopyWithImpl<$Res>
    extends _$AttributeCopyWithImpl<$Res, _$AttributeImpl>
    implements _$$AttributeImplCopyWith<$Res> {
  __$$AttributeImplCopyWithImpl(
      _$AttributeImpl _value, $Res Function(_$AttributeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? position = null,
    Object? visible = null,
    Object? variation = null,
    Object? options = null,
  }) {
    return _then(_$AttributeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      visible: null == visible
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
      variation: null == variation
          ? _value.variation
          : variation // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttributeImpl implements _Attribute {
  const _$AttributeImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "position") required this.position,
      @JsonKey(name: "visible") required this.visible,
      @JsonKey(name: "variation") required this.variation,
      @JsonKey(name: "options") required final List<String> options})
      : _options = options;

  factory _$AttributeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttributeImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "position")
  final int position;
  @override
  @JsonKey(name: "visible")
  final bool visible;
  @override
  @JsonKey(name: "variation")
  final bool variation;
  final List<String> _options;
  @override
  @JsonKey(name: "options")
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'Attribute(id: $id, name: $name, position: $position, visible: $visible, variation: $variation, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttributeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.visible, visible) || other.visible == visible) &&
            (identical(other.variation, variation) ||
                other.variation == variation) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, position, visible,
      variation, const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttributeImplCopyWith<_$AttributeImpl> get copyWith =>
      __$$AttributeImplCopyWithImpl<_$AttributeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttributeImplToJson(
      this,
    );
  }
}

abstract class _Attribute implements Attribute {
  const factory _Attribute(
          {@JsonKey(name: "id") required final int id,
          @JsonKey(name: "name") required final String name,
          @JsonKey(name: "position") required final int position,
          @JsonKey(name: "visible") required final bool visible,
          @JsonKey(name: "variation") required final bool variation,
          @JsonKey(name: "options") required final List<String> options}) =
      _$AttributeImpl;

  factory _Attribute.fromJson(Map<String, dynamic> json) =
      _$AttributeImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "position")
  int get position;
  @override
  @JsonKey(name: "visible")
  bool get visible;
  @override
  @JsonKey(name: "variation")
  bool get variation;
  @override
  @JsonKey(name: "options")
  List<String> get options;
  @override
  @JsonKey(ignore: true)
  _$$AttributeImplCopyWith<_$AttributeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "slug") String slug});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "slug") String slug});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
  }) {
    return _then(_$CategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "slug") required this.slug});

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "slug")
  final String slug;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "slug") required final String slug}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "slug")
  String get slug;
  @override
  @JsonKey(ignore: true)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Dimensions _$DimensionsFromJson(Map<String, dynamic> json) {
  return _Dimensions.fromJson(json);
}

/// @nodoc
mixin _$Dimensions {
  @JsonKey(name: "length")
  String get length => throw _privateConstructorUsedError;
  @JsonKey(name: "width")
  String get width => throw _privateConstructorUsedError;
  @JsonKey(name: "height")
  String get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DimensionsCopyWith<Dimensions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DimensionsCopyWith<$Res> {
  factory $DimensionsCopyWith(
          Dimensions value, $Res Function(Dimensions) then) =
      _$DimensionsCopyWithImpl<$Res, Dimensions>;
  @useResult
  $Res call(
      {@JsonKey(name: "length") String length,
      @JsonKey(name: "width") String width,
      @JsonKey(name: "height") String height});
}

/// @nodoc
class _$DimensionsCopyWithImpl<$Res, $Val extends Dimensions>
    implements $DimensionsCopyWith<$Res> {
  _$DimensionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DimensionsImplCopyWith<$Res>
    implements $DimensionsCopyWith<$Res> {
  factory _$$DimensionsImplCopyWith(
          _$DimensionsImpl value, $Res Function(_$DimensionsImpl) then) =
      __$$DimensionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "length") String length,
      @JsonKey(name: "width") String width,
      @JsonKey(name: "height") String height});
}

/// @nodoc
class __$$DimensionsImplCopyWithImpl<$Res>
    extends _$DimensionsCopyWithImpl<$Res, _$DimensionsImpl>
    implements _$$DimensionsImplCopyWith<$Res> {
  __$$DimensionsImplCopyWithImpl(
      _$DimensionsImpl _value, $Res Function(_$DimensionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$DimensionsImpl(
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DimensionsImpl implements _Dimensions {
  const _$DimensionsImpl(
      {@JsonKey(name: "length") required this.length,
      @JsonKey(name: "width") required this.width,
      @JsonKey(name: "height") required this.height});

  factory _$DimensionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DimensionsImplFromJson(json);

  @override
  @JsonKey(name: "length")
  final String length;
  @override
  @JsonKey(name: "width")
  final String width;
  @override
  @JsonKey(name: "height")
  final String height;

  @override
  String toString() {
    return 'Dimensions(length: $length, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DimensionsImpl &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, length, width, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DimensionsImplCopyWith<_$DimensionsImpl> get copyWith =>
      __$$DimensionsImplCopyWithImpl<_$DimensionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DimensionsImplToJson(
      this,
    );
  }
}

abstract class _Dimensions implements Dimensions {
  const factory _Dimensions(
          {@JsonKey(name: "length") required final String length,
          @JsonKey(name: "width") required final String width,
          @JsonKey(name: "height") required final String height}) =
      _$DimensionsImpl;

  factory _Dimensions.fromJson(Map<String, dynamic> json) =
      _$DimensionsImpl.fromJson;

  @override
  @JsonKey(name: "length")
  String get length;
  @override
  @JsonKey(name: "width")
  String get width;
  @override
  @JsonKey(name: "height")
  String get height;
  @override
  @JsonKey(ignore: true)
  _$$DimensionsImplCopyWith<_$DimensionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WooImage _$WooImageFromJson(Map<String, dynamic> json) {
  return _WooImage.fromJson(json);
}

/// @nodoc
mixin _$WooImage {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "date_created")
  DateTime get dateCreated => throw _privateConstructorUsedError;
  @JsonKey(name: "date_created_gmt")
  DateTime get dateCreatedGmt => throw _privateConstructorUsedError;
  @JsonKey(name: "date_modified")
  DateTime get dateModified => throw _privateConstructorUsedError;
  @JsonKey(name: "date_modified_gmt")
  DateTime get dateModifiedGmt => throw _privateConstructorUsedError;
  @JsonKey(name: "src")
  String get src => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "alt")
  String get alt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WooImageCopyWith<WooImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WooImageCopyWith<$Res> {
  factory $WooImageCopyWith(WooImage value, $Res Function(WooImage) then) =
      _$WooImageCopyWithImpl<$Res, WooImage>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "date_created") DateTime dateCreated,
      @JsonKey(name: "date_created_gmt") DateTime dateCreatedGmt,
      @JsonKey(name: "date_modified") DateTime dateModified,
      @JsonKey(name: "date_modified_gmt") DateTime dateModifiedGmt,
      @JsonKey(name: "src") String src,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "alt") String alt});
}

/// @nodoc
class _$WooImageCopyWithImpl<$Res, $Val extends WooImage>
    implements $WooImageCopyWith<$Res> {
  _$WooImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateCreated = null,
    Object? dateCreatedGmt = null,
    Object? dateModified = null,
    Object? dateModifiedGmt = null,
    Object? src = null,
    Object? name = null,
    Object? alt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateCreatedGmt: null == dateCreatedGmt
          ? _value.dateCreatedGmt
          : dateCreatedGmt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModifiedGmt: null == dateModifiedGmt
          ? _value.dateModifiedGmt
          : dateModifiedGmt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WooImageImplCopyWith<$Res>
    implements $WooImageCopyWith<$Res> {
  factory _$$WooImageImplCopyWith(
          _$WooImageImpl value, $Res Function(_$WooImageImpl) then) =
      __$$WooImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "date_created") DateTime dateCreated,
      @JsonKey(name: "date_created_gmt") DateTime dateCreatedGmt,
      @JsonKey(name: "date_modified") DateTime dateModified,
      @JsonKey(name: "date_modified_gmt") DateTime dateModifiedGmt,
      @JsonKey(name: "src") String src,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "alt") String alt});
}

/// @nodoc
class __$$WooImageImplCopyWithImpl<$Res>
    extends _$WooImageCopyWithImpl<$Res, _$WooImageImpl>
    implements _$$WooImageImplCopyWith<$Res> {
  __$$WooImageImplCopyWithImpl(
      _$WooImageImpl _value, $Res Function(_$WooImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateCreated = null,
    Object? dateCreatedGmt = null,
    Object? dateModified = null,
    Object? dateModifiedGmt = null,
    Object? src = null,
    Object? name = null,
    Object? alt = null,
  }) {
    return _then(_$WooImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateCreatedGmt: null == dateCreatedGmt
          ? _value.dateCreatedGmt
          : dateCreatedGmt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModifiedGmt: null == dateModifiedGmt
          ? _value.dateModifiedGmt
          : dateModifiedGmt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WooImageImpl implements _WooImage {
  const _$WooImageImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "date_created") required this.dateCreated,
      @JsonKey(name: "date_created_gmt") required this.dateCreatedGmt,
      @JsonKey(name: "date_modified") required this.dateModified,
      @JsonKey(name: "date_modified_gmt") required this.dateModifiedGmt,
      @JsonKey(name: "src") required this.src,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "alt") required this.alt});

  factory _$WooImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$WooImageImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "date_created")
  final DateTime dateCreated;
  @override
  @JsonKey(name: "date_created_gmt")
  final DateTime dateCreatedGmt;
  @override
  @JsonKey(name: "date_modified")
  final DateTime dateModified;
  @override
  @JsonKey(name: "date_modified_gmt")
  final DateTime dateModifiedGmt;
  @override
  @JsonKey(name: "src")
  final String src;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "alt")
  final String alt;

  @override
  String toString() {
    return 'WooImage(id: $id, dateCreated: $dateCreated, dateCreatedGmt: $dateCreatedGmt, dateModified: $dateModified, dateModifiedGmt: $dateModifiedGmt, src: $src, name: $name, alt: $alt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WooImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.dateCreatedGmt, dateCreatedGmt) ||
                other.dateCreatedGmt == dateCreatedGmt) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified) &&
            (identical(other.dateModifiedGmt, dateModifiedGmt) ||
                other.dateModifiedGmt == dateModifiedGmt) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.alt, alt) || other.alt == alt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, dateCreated, dateCreatedGmt,
      dateModified, dateModifiedGmt, src, name, alt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WooImageImplCopyWith<_$WooImageImpl> get copyWith =>
      __$$WooImageImplCopyWithImpl<_$WooImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WooImageImplToJson(
      this,
    );
  }
}

abstract class _WooImage implements WooImage {
  const factory _WooImage(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "date_created") required final DateTime dateCreated,
      @JsonKey(name: "date_created_gmt") required final DateTime dateCreatedGmt,
      @JsonKey(name: "date_modified") required final DateTime dateModified,
      @JsonKey(name: "date_modified_gmt")
      required final DateTime dateModifiedGmt,
      @JsonKey(name: "src") required final String src,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "alt") required final String alt}) = _$WooImageImpl;

  factory _WooImage.fromJson(Map<String, dynamic> json) =
      _$WooImageImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "date_created")
  DateTime get dateCreated;
  @override
  @JsonKey(name: "date_created_gmt")
  DateTime get dateCreatedGmt;
  @override
  @JsonKey(name: "date_modified")
  DateTime get dateModified;
  @override
  @JsonKey(name: "date_modified_gmt")
  DateTime get dateModifiedGmt;
  @override
  @JsonKey(name: "src")
  String get src;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "alt")
  String get alt;
  @override
  @JsonKey(ignore: true)
  _$$WooImageImplCopyWith<_$WooImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Links _$LinksFromJson(Map<String, dynamic> json) {
  return _Links.fromJson(json);
}

/// @nodoc
mixin _$Links {
  @JsonKey(name: "self")
  List<Collection> get self => throw _privateConstructorUsedError;
  @JsonKey(name: "collection")
  List<Collection> get collection => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinksCopyWith<Links> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinksCopyWith<$Res> {
  factory $LinksCopyWith(Links value, $Res Function(Links) then) =
      _$LinksCopyWithImpl<$Res, Links>;
  @useResult
  $Res call(
      {@JsonKey(name: "self") List<Collection> self,
      @JsonKey(name: "collection") List<Collection> collection});
}

/// @nodoc
class _$LinksCopyWithImpl<$Res, $Val extends Links>
    implements $LinksCopyWith<$Res> {
  _$LinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? self = null,
    Object? collection = null,
  }) {
    return _then(_value.copyWith(
      self: null == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinksImplCopyWith<$Res> implements $LinksCopyWith<$Res> {
  factory _$$LinksImplCopyWith(
          _$LinksImpl value, $Res Function(_$LinksImpl) then) =
      __$$LinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "self") List<Collection> self,
      @JsonKey(name: "collection") List<Collection> collection});
}

/// @nodoc
class __$$LinksImplCopyWithImpl<$Res>
    extends _$LinksCopyWithImpl<$Res, _$LinksImpl>
    implements _$$LinksImplCopyWith<$Res> {
  __$$LinksImplCopyWithImpl(
      _$LinksImpl _value, $Res Function(_$LinksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? self = null,
    Object? collection = null,
  }) {
    return _then(_$LinksImpl(
      self: null == self
          ? _value._self
          : self // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
      collection: null == collection
          ? _value._collection
          : collection // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinksImpl implements _Links {
  const _$LinksImpl(
      {@JsonKey(name: "self") required final List<Collection> self,
      @JsonKey(name: "collection") required final List<Collection> collection})
      : _self = self,
        _collection = collection;

  factory _$LinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinksImplFromJson(json);

  final List<Collection> _self;
  @override
  @JsonKey(name: "self")
  List<Collection> get self {
    if (_self is EqualUnmodifiableListView) return _self;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_self);
  }

  final List<Collection> _collection;
  @override
  @JsonKey(name: "collection")
  List<Collection> get collection {
    if (_collection is EqualUnmodifiableListView) return _collection;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collection);
  }

  @override
  String toString() {
    return 'Links(self: $self, collection: $collection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinksImpl &&
            const DeepCollectionEquality().equals(other._self, _self) &&
            const DeepCollectionEquality()
                .equals(other._collection, _collection));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_self),
      const DeepCollectionEquality().hash(_collection));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      __$$LinksImplCopyWithImpl<_$LinksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinksImplToJson(
      this,
    );
  }
}

abstract class _Links implements Links {
  const factory _Links(
      {@JsonKey(name: "self") required final List<Collection> self,
      @JsonKey(name: "collection")
      required final List<Collection> collection}) = _$LinksImpl;

  factory _Links.fromJson(Map<String, dynamic> json) = _$LinksImpl.fromJson;

  @override
  @JsonKey(name: "self")
  List<Collection> get self;
  @override
  @JsonKey(name: "collection")
  List<Collection> get collection;
  @override
  @JsonKey(ignore: true)
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Collection _$CollectionFromJson(Map<String, dynamic> json) {
  return _Collection.fromJson(json);
}

/// @nodoc
mixin _$Collection {
  @JsonKey(name: "href")
  String get href => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectionCopyWith<Collection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionCopyWith<$Res> {
  factory $CollectionCopyWith(
          Collection value, $Res Function(Collection) then) =
      _$CollectionCopyWithImpl<$Res, Collection>;
  @useResult
  $Res call({@JsonKey(name: "href") String href});
}

/// @nodoc
class _$CollectionCopyWithImpl<$Res, $Val extends Collection>
    implements $CollectionCopyWith<$Res> {
  _$CollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? href = null,
  }) {
    return _then(_value.copyWith(
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionImplCopyWith<$Res>
    implements $CollectionCopyWith<$Res> {
  factory _$$CollectionImplCopyWith(
          _$CollectionImpl value, $Res Function(_$CollectionImpl) then) =
      __$$CollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "href") String href});
}

/// @nodoc
class __$$CollectionImplCopyWithImpl<$Res>
    extends _$CollectionCopyWithImpl<$Res, _$CollectionImpl>
    implements _$$CollectionImplCopyWith<$Res> {
  __$$CollectionImplCopyWithImpl(
      _$CollectionImpl _value, $Res Function(_$CollectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? href = null,
  }) {
    return _then(_$CollectionImpl(
      href: null == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionImpl implements _Collection {
  const _$CollectionImpl({@JsonKey(name: "href") required this.href});

  factory _$CollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionImplFromJson(json);

  @override
  @JsonKey(name: "href")
  final String href;

  @override
  String toString() {
    return 'Collection(href: $href)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionImpl &&
            (identical(other.href, href) || other.href == href));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, href);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionImplCopyWith<_$CollectionImpl> get copyWith =>
      __$$CollectionImplCopyWithImpl<_$CollectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionImplToJson(
      this,
    );
  }
}

abstract class _Collection implements Collection {
  const factory _Collection(
      {@JsonKey(name: "href") required final String href}) = _$CollectionImpl;

  factory _Collection.fromJson(Map<String, dynamic> json) =
      _$CollectionImpl.fromJson;

  @override
  @JsonKey(name: "href")
  String get href;
  @override
  @JsonKey(ignore: true)
  _$$CollectionImplCopyWith<_$CollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetaDatum _$MetaDatumFromJson(Map<String, dynamic> json) {
  return _MetaDatum.fromJson(json);
}

/// @nodoc
mixin _$MetaDatum {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "key")
  String get key => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaDatumCopyWith<MetaDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaDatumCopyWith<$Res> {
  factory $MetaDatumCopyWith(MetaDatum value, $Res Function(MetaDatum) then) =
      _$MetaDatumCopyWithImpl<$Res, MetaDatum>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "key") String key,
      @JsonKey(name: "value") String value});
}

/// @nodoc
class _$MetaDatumCopyWithImpl<$Res, $Val extends MetaDatum>
    implements $MetaDatumCopyWith<$Res> {
  _$MetaDatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaDatumImplCopyWith<$Res>
    implements $MetaDatumCopyWith<$Res> {
  factory _$$MetaDatumImplCopyWith(
          _$MetaDatumImpl value, $Res Function(_$MetaDatumImpl) then) =
      __$$MetaDatumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "key") String key,
      @JsonKey(name: "value") String value});
}

/// @nodoc
class __$$MetaDatumImplCopyWithImpl<$Res>
    extends _$MetaDatumCopyWithImpl<$Res, _$MetaDatumImpl>
    implements _$$MetaDatumImplCopyWith<$Res> {
  __$$MetaDatumImplCopyWithImpl(
      _$MetaDatumImpl _value, $Res Function(_$MetaDatumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_$MetaDatumImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaDatumImpl implements _MetaDatum {
  const _$MetaDatumImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "key") required this.key,
      @JsonKey(name: "value") required this.value});

  factory _$MetaDatumImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaDatumImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "key")
  final String key;
  @override
  @JsonKey(name: "value")
  final String value;

  @override
  String toString() {
    return 'MetaDatum(id: $id, key: $key, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaDatumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, key, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaDatumImplCopyWith<_$MetaDatumImpl> get copyWith =>
      __$$MetaDatumImplCopyWithImpl<_$MetaDatumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaDatumImplToJson(
      this,
    );
  }
}

abstract class _MetaDatum implements MetaDatum {
  const factory _MetaDatum(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "key") required final String key,
      @JsonKey(name: "value") required final String value}) = _$MetaDatumImpl;

  factory _MetaDatum.fromJson(Map<String, dynamic> json) =
      _$MetaDatumImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "key")
  String get key;
  @override
  @JsonKey(name: "value")
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$MetaDatumImplCopyWith<_$MetaDatumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
