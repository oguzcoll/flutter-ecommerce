// ignore: file_names
class Product {
  final String name;
  final List<String> images;
  final double normalPrice;
  final double discountedPrice;
  final int stock;
  int count;

  Product({
    required this.name,
    required this.images,
    required this.normalPrice,
    required this.discountedPrice,
    required this.stock,
    this.count = 0,
  });
}
