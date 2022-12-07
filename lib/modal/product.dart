import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  num price;
  @HiveField(4)
  String thumbnail;
  @HiveField(5)
  List? images;

  Product(
      {this.id,
      required this.name,
      this.description,
      required this.price,
      required this.thumbnail,
      required this.images});
}
