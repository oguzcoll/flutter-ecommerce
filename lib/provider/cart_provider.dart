import 'package:flutter/material.dart';
import 'package:hepsiorda/models/product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cartItems = [];

  void addToCart(Product product) {
    final index = cartItems.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      cartItems[index].count++;
    } else {
      final clonedProduct = Product(
        name: product.name,
        image: product.image,
        normalPrice: product.normalPrice,
        discountedPrice: product.discountedPrice,
        stock: product.stock,
        count: 1,
      );
      cartItems.add(clonedProduct);
    }
    notifyListeners(); // Notify listeners when the cart is updated.
  }

  void updateCartItem(Product product, int newCount) {
    final index = cartItems.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      cartItems[index].count = newCount;
      notifyListeners(); // Notify listeners when the cart item count is updated.
    }
  }
}
