import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hepsiorda/models/product.dart';

Future<List<Product>> fetchProducts(BuildContext context) async {
  final String jsonData = await DefaultAssetBundle.of(context)
      .loadString('lib/assets/products.json');
  final List<dynamic> data = json.decode(jsonData);

  // JSON verileri Product sınıfına dönüştü
  final List<Product> products = data
      .map((json) => Product(
            name: json['name'],
            image: json['image'],
            normalPrice: json['normalPrice'],
            discountedPrice: json['discountedPrice'],
            stock: json['stock'],
          ))
      .toList();

  return products;
}
