import 'package:json/json.dart';

@JsonCodable() // Macro annotation.
class User {
  final int? age;
  final String name;
  final String username;
}
