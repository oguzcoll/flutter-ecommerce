import 'package:flutter/material.dart';
import 'package:hepsiorda/models/product.dart';
import 'package:hepsiorda/provider/cart_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    final totalDiscountPrice = cartProvider.getTotalDiscountPrice();
    final totalDiscountPriceFormatted =
        NumberFormat.currency(locale: 'en_US', symbol: '')
            .format(totalDiscountPrice);

    final selectedProducts = cartProvider.selectedProducts;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: AppBar(
            title: const Text(
              "Sipariş Detayı",
            ),
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              "Ürün Bilgileri",
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Container(
                height: MediaQuery.of(context).size.height /
                    3.1, // Half of the screen
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromARGB(255, 227, 225, 225),
                ),
                child: ListView.builder(
                  itemCount: selectedProducts.length,
                  itemBuilder: (context, index) {
                    final product = selectedProducts[index];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Ürün Adı",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    product.name,
                                    style: TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Miktar",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  product.count.toString(),
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Birim Fiyatı",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  " ${product.normalPrice.toStringAsFixed(2)} TL",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              children: [
                                Text(
                                  "İndirimli Birim Fiyatı",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "${product.discountedPrice.toStringAsFixed(2)} TL",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Ürün Toplam Fiyatı",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "${(product.discountedPrice * product.count).toStringAsFixed(2)} TL",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                            SizedBox(height: 17), // Add spacing between rows
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            const Divider(
              height: 2, // Adjust the height of the line
              thickness: 1, // Adjust the thickness of the line
              color: Color.fromARGB(
                  255, 146, 145, 145), // Adjust the color of the line
            ),
            ListView(
              shrinkWrap: true,
              children: const [
                Card(
                  child: ListTile(
                    title: Text(
                      "Sipariş Açıklaması",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.redAccent,
                      ),
                    ),
                    trailing: Text("asddsa"),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "Sipariş Teslimat Adresi",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.redAccent,
                      ),
                    ),
                    trailing: Text("--"),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "Sipariş Oluşturulma Tarihi",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.redAccent,
                      ),
                    ),
                    trailing: Text("2023-08-16 11:00:23"),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "Sipariş Teslim Tarihi",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.redAccent,
                      ),
                    ),
                    trailing: Text("2023-08-16"),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "Ödeme Yöntemi",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.redAccent,
                      ),
                    ),
                    trailing: Text("--"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            const Divider(
              height: 2, // Adjust the height of the line
              thickness: 1, // Adjust the thickness of the line
              color: Color.fromARGB(
                  255, 146, 145, 145), // Adjust the color of the line
            ),
            const SizedBox(
              height: 13,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 199, 199, 199),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [Text("Ad"), Text("Ali Koç")],
                    ),
                    Column(
                      children: [Text("Tel"), Text("05061234567")],
                    ),
                    Column(
                      children: [
                        Text("Toplam"),
                        Text("$totalDiscountPriceFormatted TL")
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
