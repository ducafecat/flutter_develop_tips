class Category {
  int? id;
  String? name;
  String? slug;

  Category({this.id, this.name, this.slug});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
      };
}
