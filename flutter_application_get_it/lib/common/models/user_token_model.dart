class UserTokenModel {
  String? token;

  UserTokenModel({this.token});

  factory UserTokenModel.fromJson(Map<String, dynamic> json) {
    return UserTokenModel(
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
