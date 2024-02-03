class Vehicle {
  String color;
  String mfd;
  String model;
  String wheeltype;
  String brand;
  List images;

  Vehicle({
    required this.color,
    required this.brand,
    required this.mfd,
    required this.model,
    required this.wheeltype,
    required this.images,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
        color: json['color'],
        mfd: json['mfd'],
        model: json['model'],
        wheeltype: json['wheeltype'],
        brand: json["brand"],
        images: json['image']);
  }
}
