import 'package:hustler_syn/core/constant/app_assets.dart';
import 'package:hustler_syn/core/model/service_price_model.dart';

class AppUserModel {
  String? id;
  String? image;
  String? name;
  String? email;
  String? password;

  String? phoneNumber;
  String? description;

  AppUserModel({
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
  factory AppUserModel.fromJson(Map<String, dynamic> json) {
    return AppUserModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      email: json['email'],
  
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
