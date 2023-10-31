import 'links.dart';

class AttributeModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? menuOrder;
  int? count;
  Links? links;

  AttributeModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.menuOrder,
    this.count,
    this.links,
  });

  factory AttributeModel.fromJson(Map<String, dynamic> json) {
    return AttributeModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      menuOrder: json['menu_order'] as int?,
      count: json['count'] as int?,
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'description': description,
        'menu_order': menuOrder,
        'count': count,
        '_links': links?.toJson(),
      };
}
