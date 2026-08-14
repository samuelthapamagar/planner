// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String name;
  final String email;

  UserModel({required this.name, required this.email});

  UserModel copyWith({String? name, String? email}) =>
      UserModel(name: name ?? this.name, email: email ?? this.email);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(name: json["name"], email: json["email"]);

  Map<String, dynamic> toJson() => {"name": name, "email": email};
}
