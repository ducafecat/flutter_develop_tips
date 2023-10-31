class Collection {
  String? href;

  Collection({this.href});

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
      };
}
