import 'package:flutter/material.dart';
import 'package:hepsiorda/models/product.dart';
import 'package:intl/intl.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cartItems = [];

  void addToCart(Product product) {
    final index = cartItems.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      cartItems[index].count++;
    } else {
      final clonedProduct = Product(
        name: product.name,
        images: List<String>.from(product.images),
        normalPrice: product.normalPrice,
        discountedPrice: product.discountedPrice,
        stock: product.stock,
        count: 1,
      );
      cartItems.add(clonedProduct);
    }
    notifyListeners(); // Notify listeners when the cart is updated.
    updateFormattedTotalDiscountPrice();
  }

  void updateCartItem(Product product, int newCount) {
    final index = cartItems.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      cartItems[index].count = newCount;
      notifyListeners(); // Notify listeners when the cart item count is updated.
      updateFormattedTotalDiscountPrice();
    }
  }

  void removeFromCart(Product product) {
    cartItems.removeWhere((item) => item.name == product.name);
    notifyListeners();
    updateFormattedTotalDiscountPrice();
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (final item in cartItems) {
      totalPrice += item.normalPrice * item.count;
    }
    return totalPrice;
  }

  double getTotalDiscountPrice() {
    double totalDiscountPrice = 0;
    for (final item in cartItems) {
      totalDiscountPrice += item.discountedPrice * item.count;
    }
    return totalDiscountPrice;
  }

  double getGeneralPrice() {
    return getTotalPrice() - getTotalDiscountPrice();
  }

  String _totalDiscountPriceFormatted = '0'; // Initialize with a default value

  // Getter for formatted total discount price
  String get totalDiscountPriceFormatted => _totalDiscountPriceFormatted;

  // Update the formatted total discount price
  void updateFormattedTotalDiscountPrice() {
    final totalDiscountPrice = getTotalDiscountPrice() -
        (getTotalDiscountPrice() *
            (discountPercentage / 100)); // Add discount calculation logic here
    _totalDiscountPriceFormatted = NumberFormat.currency(
      locale: 'en_US',
      symbol: '',
    ).format(totalDiscountPrice);
    notifyListeners();
  }

  // Add a field to store the discount percentage
  double discountPercentage = 0;

  // Setter for discount percentage
  setDiscountPercentage(double percentage) {
    discountPercentage = percentage;
    updateFormattedTotalDiscountPrice();
  }

  // Add a new field to store selected products
  List<Product> selectedProducts = [];

  // Method to add selected products to the order
  void addSelectedProducts(List<Product> products) {
    selectedProducts.clear();
    selectedProducts.addAll(products);
    notifyListeners();
  }

  // Clear cart after ordering
  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }
}
