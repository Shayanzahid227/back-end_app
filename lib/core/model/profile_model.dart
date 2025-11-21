import 'package:hustler_syn/core/model/service_price_model.dart';

class ProfileModel {
  String? id;
  String? image;
  String? name;
  String? role;
  double? rating;
  String? distance;
  bool? isVerified;
  String? description;
  List<ServicePrice>? servicePrices;
  List<String>? tags;

  ProfileModel({
    this.id,
    this.image,
    this.name,
    this.role,
    this.rating,
    this.distance,
    this.isVerified,
    this.description,
    this.servicePrices,
    this.tags,
  });

  /// ---------------------------
  /// FROM JSON
  /// ---------------------------
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      role: json['role'],
      rating: json['rating']?.toDouble(),
      distance: json['distance'],
      isVerified: json['isVerified'],
      description: json['description'],
      servicePrices: json['servicePrices'] != null
          ? (json['servicePrices'] as List)
              .map((e) => ServicePrice.fromJson(e))
              .toList()
          : [],
      tags: json['tags'] != null
          ? List<String>.from(json['tags'])
          : [],
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
      'role': role,
      'rating': rating,
      'distance': distance,
      'isVerified': isVerified,
      'description': description,
      'servicePrices': servicePrices != null
          ? servicePrices!.map((e) => e.toJson()).toList()
          : [],
      'tags': tags ?? [],
    };
  }
}
