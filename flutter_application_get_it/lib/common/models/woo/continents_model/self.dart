class Self {
  String? href;

  Self({this.href});

  factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
      };
}
