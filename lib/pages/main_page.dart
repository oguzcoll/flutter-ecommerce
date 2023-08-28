import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hepsiorda/models/product.dart';
import 'package:hepsiorda/pages/cart_page.dart';
import 'package:hepsiorda/utils/json_helper.dart';

import '../provider/cart_provider.dart';
import '../widgets/products.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    int _getCrossAxisCount(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;

      if (screenWidth <= 700) {
        return 2; // For screens less than or equal to 700px, show 2 items side by side.
      } else if (screenWidth <= 1000) {
        return 3; // For screens between 701px and 1000px, show 3 items side by side.
      } else if (screenWidth <= 1491) {
        return 4;
      } else {
        return 5;
      }
    }

    double _getChildAspectRatio(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;

      if (screenWidth <= 600) {
        return 0.7; // Aspect ratio for screens less than or equal to 700px.
      } else if (screenWidth <= 1830) {
        return 0.6; // Aspect ratio for screens between 701px and 1830px.
      } else {
        return 0.5; // Increase the aspect ratio for screens wider than 1830px.
      }
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 238, 239),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 233, 238, 239),
        leading: IconButton(
          icon: const Icon(
            Icons.home,
            size: 40,
          ),
          onPressed: () {},
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "GULSOY.HOME",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 8.0, left: 10),
            child: Text(
              "Arama Sonuçları",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Ara...",
                      icon: Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Icon(Icons.zoom_in),
                width: 50,
                height: 50,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  child: Icon(Icons.ac_unit),
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<Product>>(
              future: fetchProducts(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text(
                      'Veriler yüklenirken bir hata oluştu: ${snapshot.error}');
                } else {
                  final List<Product>? products = snapshot.data;
                  return Consumer<CartProvider>(
                      builder: (context, cartProvider, child) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _getCrossAxisCount(context),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: _getChildAspectRatio(context),
                      ),
                      itemCount: products?.length ?? 0,
                      itemBuilder: (context, index) {
                        final product = products![index];
                        final cartItem = cartProvider.cartItems.firstWhere(
                          (item) => item.name == product.name,
                          orElse: () => product,
                        );
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Products(
                            key: Key(product.name),
                            product: cartItem,
                            addToCart: () {
                              // Use the CartProvider to add items to the cart
                              Provider.of<CartProvider>(context, listen: false)
                                  .addToCart(product);
                            },
                            cartItemCount:
                                cartItem.count, // Pass the cart item count
                          ),
                        );
                      },
                    );
                  });
                }
              },
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return Container(
                color: Colors.brown,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => CartPage(
                            cartItems: cartProvider.cartItems,
                            updateCartItem: (Product product, int newCount) {
                              cartProvider.updateCartItem(product, newCount);
                            }),
                      ),
                    );
                  },
                  child: Text(
                    "Sepete Git (${cartProvider.cartItems.length})",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
