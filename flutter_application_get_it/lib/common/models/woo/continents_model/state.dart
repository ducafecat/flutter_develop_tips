class State {
  String? code;
  String? name;

  State({
    this.code,
    this.name,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        code: "${json['code']}",
        name: "${json['name']}",
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
      };
}
