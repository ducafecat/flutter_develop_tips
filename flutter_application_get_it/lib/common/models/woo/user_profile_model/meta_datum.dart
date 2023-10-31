class MetaDatum {
  int? id;
  String? key;
  String? value;

  MetaDatum({this.id, this.key, this.value});

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        id: json['id'] as int?,
        key: json['key'] as String?,
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'key': key,
        'value': value,
      };
}
