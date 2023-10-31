class Billing {
  String? firstName;
  String? lastName;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? postcode;
  String? country;
  String? state;
  String? email;
  String? phone;

  Billing({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.postcode,
    this.country,
    this.state,
    this.email,
    this.phone,
  });

  factory Billing.fromJson(Map<String, dynamic> json) => Billing(
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        company: json['company'] as String?,
        address1: json['address_1'] as String?,
        address2: json['address_2'] as String?,
        city: json['city'] as String?,
        postcode: json['postcode'] as String?,
        country: json['country'] as String?,
        state: json['state'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'company': company,
        'address_1': address1,
        'address_2': address2,
        'city': city,
        'postcode': postcode,
        'country': country,
        'state': state,
        'email': email,
        'phone': phone,
      };
}
