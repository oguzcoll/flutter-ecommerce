import 'package:flutter/material.dart';
import 'package:hepsiorda/models/product.dart';

class Products extends StatefulWidget {
  final Product product;

  const Products({super.key, required this.product});

  @override
  State<StatefulWidget> createState() {
    return _ProductsState();
  }
}

class _ProductsState extends State<Products> {
  int productCount = 0;
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromARGB(149, 244, 239, 239),
          border: Border.all(color: Colors.white, width: 2)),
      child: Column(
        children: [
          Image.asset(
            product.image,
            height: 90,
            width: 90,
          ),
          const SizedBox(
            height: 5,
          ),
          // ürün adı
          Text(
            product.name,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 12.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),

          // Normal Fiyatı
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "N. Fiyatı:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                " ${product.normalPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "K.Fiyatı:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                " ${product.discountedPrice.toStringAsFixed(2)}",
                // Diğer metinlerde olduğu gibi ihtiyaca göre burada da stillendirme yapabilirsiniz.
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Stok:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' ${product.stock.toStringAsFixed(0)}',
                // Diğer metinlerde olduğu gibi ihtiyaca göre burada da stillendirme yapabilirsiniz.
              ),
            ],
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
