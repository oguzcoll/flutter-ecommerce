import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductsState();
  }
}

class _ProductsState extends State<Products> {
  int productCount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromARGB(149, 244, 239, 239),
          border: Border.all(color: Colors.white, width: 2)),
      child: Column(
        children: [
          Image.asset(
            'lib/assets/image1.png',
            height: 90,
            width: 90,
          ),
          const SizedBox(
            height: 5,
          ),
          // ürün adı
          const Text(
            "Vito Koltuk Takımı",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          // Normal Fiyatı
          const Text(
            "N.fiyatı: 4620.0",
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          // Kampanyalı Fiyatı
          Text("K.fiyatı: 4620.0"),
          const SizedBox(
            height: 5,
          ),
          // Stok Sayısı
          Text("Stok: 3.0"),
          const SizedBox(
            height: 5,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (productCount > 0) {
                      productCount--;
                    }
                  });
                },
                child: Container(
                  width: 53,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                    ),
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
              Container(
                width: 35,
                height: 35,
                color: Color.fromARGB(255, 204, 206, 208),
                child: Center(
                  child: Text(
                    productCount.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    productCount++;
                  });
                },
                child: Container(
                  width: 53,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
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
              )
            ],
          )
        ],
      ),
    );
  }
}
