class ServicePrice {
  String? serviceName;
  String? price;
  String? description;
  String? duration;

  ServicePrice({
    this.serviceName,
    this.price,
    this.description,
    this.duration,
  });

  /// ---------------------------
  /// FROM JSON
  /// ---------------------------
  factory ServicePrice.fromJson(Map<String, dynamic> json) {
    return ServicePrice(
      serviceName: json['serviceName'],
      price: json['price'],
      description: json['description'],
      duration: json['duration'],
    );
  }

  /// ---------------------------
  /// TO JSON 
  /// ---------------------------
  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'price': price,
      'description': description,
      'duration': duration,
    };
  }
}
