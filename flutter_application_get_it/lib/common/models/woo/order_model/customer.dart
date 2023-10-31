class Customer {
  String? href;

  Customer({this.href});

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
      };
}
