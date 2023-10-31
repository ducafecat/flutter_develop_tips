class Up {
  String? href;

  Up({this.href});

  factory Up.fromJson(Map<String, dynamic> json) => Up(
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
      };
}
