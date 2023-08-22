import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() {
    return _CartItemState();
  }
}

class _CartItemState extends State<CartItem> {
  int itemCount = 1; // Öğenin varsayılan sayısı

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(2),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: ListTile(
          leading: Image.asset('lib/assets/image1.png', height: 80, width: 80),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Vito Koltuk Takımı", // Ürün adı
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                "N.F: 4620.0",
                style: TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough,
                ),
              ), // Normal fiyatı
              Text(
                "K.F: 4620.0",
                style: TextStyle(fontSize: 14),
              ), // Kampanyalı fiyatı
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (itemCount > 1) {
                      itemCount--;
                    }
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 249, 244, 244),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      "-",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 204, 203, 203),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    itemCount.toString(), // Ürün sayısı
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    itemCount++;
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 249, 244, 244),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
