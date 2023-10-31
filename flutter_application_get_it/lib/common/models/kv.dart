/// key value 键值对
class KeyValueModel<T> {
  String key;
  T value;

  KeyValueModel({required this.key, required this.value});

  factory KeyValueModel.fromJson(Map<String, dynamic> json) {
    return KeyValueModel(
      key: json['key'] as String,
      value: json['value'] as T,
    );
  }

  Map<String, dynamic> toJson() => {
        'key': key,
        'value': value,
      };

  @override
  String toString() {
    return "$value";
  }
}
