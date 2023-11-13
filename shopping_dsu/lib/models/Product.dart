import 'package:intl/intl.dart';

class Product {
  final String title, description;
  final List<String> images;
  final double price;
  final bool isPopular;

  Product(
      {required this.images,
      this.isPopular = false,
      required this.title,
      required this.price,
      required this.description});
}

final NumberFormat numberFormat = NumberFormat('###,###,###,###');
List<Product> demoProducts = [
  Product(
      images: ["assets/images/corn_1.jpg"],
      title: "강원도 못난이 옥수수",
      price: 7000,
      description: 'veve',
      isPopular: true),
  Product(
      images: ["assets/images/carrot1.jpg"],
      title: "제주 못난이 당근",
      price: 5000,
      description: '귤',
      isPopular: true),
];
