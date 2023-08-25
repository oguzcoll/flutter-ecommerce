import 'package:flutter/material.dart';
import 'package:hepsiorda/models/product.dart';

class Products extends StatefulWidget {
  final Product product;
  final Function() addToCart;
  final Key key;

  const Products(
      {required this.key, required this.product, required this.addToCart});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    void increaseCount() {
      if (widget.product.count < widget.product.stock) {
        setState(() {
          widget.product.count++;
        });
        widget.addToCart();
      }
    }

    return Container(
      key: widget.key,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(149, 244, 239, 239),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Column(
        children: [
          Image.asset(
            widget.product.image,
            height: 90,
            width: 90,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.product.name,
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
                " ${widget.product.normalPrice.toStringAsFixed(2)}",
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
                " ${widget.product.discountedPrice.toStringAsFixed(2)}",
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
                ' ${widget.product.stock.toStringAsFixed(0)}',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (widget.product.count > 0) {
                      widget.product.count--;
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
                    widget.product.count.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: increaseCount,
                child: Container(
                  width: 53,
                  height: 40,
                  decoration: BoxDecoration(
                    color: widget.product.count < widget.product.stock
                        ? Colors.white
                        : const Color.fromARGB(255, 215, 214, 214),
                    borderRadius: const BorderRadius.only(
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
