import 'package:hustler_syn/core/model/service_price_model.dart';

class UserModel {
  String? id;
  String? image;
  String? name;
  String? email;
  String? password;

  String? phoneNumber;
  String? description;

  UserModel({
    this.id,
    this.image,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.description,
  });

  /// ---------------------------
  /// FROM JSON
  /// ---------------------------
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      description: json['description'],
    );
  }

  /// ---------------------------
  /// TO JSON
  /// ---------------------------
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'description': description,
    };
  }
}
