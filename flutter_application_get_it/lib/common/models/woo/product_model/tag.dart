class Tag {
  int? id;
  String? name;
  String? slug;

  Tag({this.id, this.name, this.slug});

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
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
