import 'package:flutter/material.dart';
import 'package:hepsiorda/models/product.dart';
import 'package:hepsiorda/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  final Product product;
  final Function() addToCart;
  final Key key;
  final int cartItemCount;

  const Products({
    required this.key,
    required this.product,
    required this.addToCart,
    required this.cartItemCount,
  });

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    void increaseCount() {
      if (widget.cartItemCount < widget.product.stock) {
        widget.addToCart();
      }
    }

    return LayoutBuilder(builder: (context, constraints) {
      final scalingFactor = constraints.maxWidth / 240.0;
      final pageViewAspectRatio = 16.0 / 9.0; // Set your desire aspect ratio

      return Consumer<CartProvider>(builder: (context, cartProvider, child) {
        return Container(
          key: widget.key,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(149, 244, 239, 239),
            border: Border.all(color: Colors.white, width: 2 * scalingFactor),
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: pageViewAspectRatio,
                child: PageView.builder(
                    itemCount: widget.product.images.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return FractionallySizedBox(
                        widthFactor: 0.7 * scalingFactor,
                        child: Image.asset(
                          widget.product.images[index],
                          fit: BoxFit.fitWidth,
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.product.name,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16 * scalingFactor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "N. Fiyatı:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17 * scalingFactor,
                    ),
                  ),
                  Text(
                    " ${widget.product.normalPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 17 * scalingFactor,
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
                  Text(
                    "K.Fiyatı:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17 * scalingFactor,
                    ),
                  ),
                  Text(
                    " ${widget.product.discountedPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 17 * scalingFactor,
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
                  Text(
                    "Stok:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17 * scalingFactor,
                    ),
                  ),
                  Text(
                    ' ${widget.product.stock.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 17 * scalingFactor,
                    ),
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
                      width: 59 * scalingFactor,
                      height: 45 * scalingFactor,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6 * scalingFactor),
                          bottomLeft: Radius.circular(6 * scalingFactor),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 22 * scalingFactor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 52 * scalingFactor,
                    height: 36 * scalingFactor,
                    color: Color.fromARGB(255, 204, 206, 208),
                    child: Center(
                      child: Text(
                        widget.product.count.toString(),
                        style: TextStyle(
                          fontSize: 22 * scalingFactor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: increaseCount,
                    child: Container(
                      width: 59 * scalingFactor,
                      height: 45 * scalingFactor,
                      decoration: BoxDecoration(
                        color: widget.product.count < widget.product.stock
                            ? Colors.white
                            : const Color.fromARGB(255, 215, 214, 214),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6 * scalingFactor),
                          bottomRight: Radius.circular(6 * scalingFactor),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontSize: 22 * scalingFactor,
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
      });
    });
  }
}
