import 'package:flutter/material.dart';
import 'package:hepsiorda/models/product.dart';
import 'package:hepsiorda/pages/cart_page.dart';
import 'package:hepsiorda/utils/json_helper.dart';

import '../widgets/products.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  List<Product> cartItems = [];

  addToCart(Product product) {
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
        count: 1, // Set count to 1 for a new product.
      );
      cartItems.add(clonedProduct);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: products?.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = products![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Products(
                          key: Key(product.name),
                          product: product,
                          addToCart: () => addToCart(product),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Container(
            color: Colors.brown,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => CartPage(
                      cartItems: cartItems,
                    ),
                  ),
                );
              },
              child: const Text(
                "Sepete Git",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
