import 'package:hive_flutter/hive_flutter.dart';

part 'product.g.dart';

@HiveType(typeId: 2)
class Product {
  @HiveField(0)
  int id;

  @HiveField(1)
  int quantity;

  @HiveField(2)
  String image;

  @HiveField(3)
  String title;

  @HiveField(4)
  String subTitle;

  @HiveField(5)
  double price;

  @HiveField(6)
  double rating;

  Product({
    required this.id,
    required this.quantity,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.rating,
  });
}
