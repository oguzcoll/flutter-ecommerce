import 'package:flutter/material.dart';
import 'package:hepsiorda/models/product.dart';
import 'package:hepsiorda/widgets/cart_item.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;
  final void Function(Product, int) updateCartItem;
  const CartPage({
    super.key,
    required this.cartItems,
    required this.updateCartItem,
  });

  @override
  State<CartPage> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  void updateCartItem(Product product, int newCount) {
    Provider.of<CartProvider>(context, listen: false)
        .updateCartItem(product, newCount);
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = widget.cartItems;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 242, 242),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 233, 238, 239),
        leading: IconButton(
          icon: const Icon(
            Icons.home,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Sepet",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child:
                Consumer<CartProvider>(builder: (context, cartProvider, child) {
              final cartItems = cartProvider.cartItems;
              return ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItems[index];
                  return CartItem(
                    item: cartItem,
                    initialItemCount: cartItem.count,
                    onItemCountChanged: (newCount) {
                      updateCartItem(cartItem, newCount);
                    },
                  );
                },
              );
            }),
          ),
          TextField(),
          // Toplam Fiyat
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white, // Arka plan rengi
              border: Border.all(
                  color: Color.fromARGB(255, 170, 168, 168)), // Border rengi
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Gölge rengi
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // Gölge konumu
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Toplam Fiyatı",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "41.930,00 TL",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          // Toplam İndirimli Fiyat
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white, // Arka plan rengi
              border: Border.all(
                  color: Color.fromARGB(255, 170, 168, 168)), // Border rengi
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Gölge rengi
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // Gölge konumu
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Toplam İndirim Fiyatı",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "29.351,00 TL",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          // Genel toplam
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.brown),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Genel Toplam",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "2249.99 TL",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Alışverişe Devam Et
          Container(
            color: Color.fromARGB(255, 169, 124, 107),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Alışverişe Devam Et",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // Row -> sipariş ekle / sipariş ekle ve onayla

          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.brown,
                  child: TextButton(
                    child: const Text(
                      "SİPARİŞ EKLE",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(179, 137, 133, 133),
                  child: TextButton(
                    child: const Text(
                      "SİPARİŞ EKLE VE ONAYLA",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
