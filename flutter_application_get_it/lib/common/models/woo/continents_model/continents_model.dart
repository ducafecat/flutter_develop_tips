import 'country.dart';
import 'links.dart';

class ContinentsModel {
  String? code;
  String? name;
  List<Country>? countries;
  Links? links;

  ContinentsModel({this.code, this.name, this.countries, this.links});

  factory ContinentsModel.fromJson(Map<String, dynamic> json) {
    return ContinentsModel(
      code: json['code'] as String?,
      name: json['name'] as String?,
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'countries': countries?.map((e) => e.toJson()).toList(),
        '_links': links?.toJson(),
      };
}
