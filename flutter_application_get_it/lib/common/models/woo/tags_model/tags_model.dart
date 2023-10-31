import 'links.dart';

class TagsModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? count;
  Links? links;

  TagsModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.count,
    this.links,
  });

  factory TagsModel.fromJson(Map<String, dynamic> json) => TagsModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        description: json['description'] as String?,
        count: json['count'] as int?,
        links: json['_links'] == null
            ? null
            : Links.fromJson(json['_links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'description': description,
        'count': count,
        '_links': links?.toJson(),
      };
}
