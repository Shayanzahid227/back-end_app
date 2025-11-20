

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
}
