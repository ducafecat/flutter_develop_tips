import 'state.dart';

class Country {
  String? code;
  String? name;
  String? currencyCode;
  String? currencyPos;
  String? decimalSep;
  String? dimensionUnit;
  int? numDecimals;
  String? thousandSep;
  String? weightUnit;
  List<State>? states;

  Country({
    this.code,
    this.name,
    this.currencyCode,
    this.currencyPos,
    this.decimalSep,
    this.dimensionUnit,
    this.numDecimals,
    this.thousandSep,
    this.weightUnit,
    this.states,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        code: json['code'] as String?,
        name: json['name'] as String?,
        currencyCode: json['currency_code'] as String?,
        currencyPos: json['currency_pos'] as String?,
        decimalSep: json['decimal_sep'] as String?,
        dimensionUnit: json['dimension_unit'] as String?,
        numDecimals: json['num_decimals'] as int?,
        thousandSep: json['thousand_sep'] as String?,
        weightUnit: json['weight_unit'] as String?,
        states: (json['states'] as List<dynamic>?)
            ?.map((e) => State.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'currency_code': currencyCode,
        'currency_pos': currencyPos,
        'decimal_sep': decimalSep,
        'dimension_unit': dimensionUnit,
        'num_decimals': numDecimals,
        'thousand_sep': thousandSep,
        'weight_unit': weightUnit,
        'states': states?.map((e) => e.toJson()).toList(),
      };
}
