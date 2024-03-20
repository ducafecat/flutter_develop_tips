class UserEntrty {
  final String? id;
  final String? name;
  final String? email;

  UserEntrty({this.id, this.name, this.email});

  factory UserEntrty.fromJson(Map<String, dynamic> json) {
    return UserEntrty(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
