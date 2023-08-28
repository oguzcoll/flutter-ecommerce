import 'package:flutter/material.dart';
import 'package:hepsiorda/models/product.dart';
import 'package:hepsiorda/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Product item;
  final int initialItemCount;
  final Function(int) onItemCountChanged;
  final Function() onItemRemoved;
  const CartItem({
    Key? key,
    required this.item,
    required this.initialItemCount,
    required this.onItemCountChanged,
    required this.onItemRemoved,
  }) : super(key: key);
  @override
  State<CartItem> createState() {
    return _CartItemState();
  }
}

class _CartItemState extends State<CartItem> {
  int _itemCount;
  late int _maxItemCount; // Add this variable

  _CartItemState() : _itemCount = 0; // Initialize _itemCount to 0

  @override
  void initState() {
    super.initState();
    _itemCount = widget.initialItemCount;
    _maxItemCount = widget.item.stock; // Initialize _maxItemCount
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      final itemCount = cartProvider.cartItems
          .firstWhere(
            (item) => item.name == widget.item.name,
            orElse: () => widget.item,
          )
          .count;

      void decreaseCountFromCart() {
        setState(() {
          if (_itemCount > 1) {
            _itemCount--;
            widget.onItemCountChanged(_itemCount);
          } else {
            widget.onItemRemoved();
          }
        });
        cartProvider.updateCartItem(widget.item, _itemCount);
      }

      void increaseCountFromCart() {
        setState(() {
          if (_itemCount < _maxItemCount) {
            _itemCount++;
            widget.onItemCountChanged(_itemCount);
          }
        });
        cartProvider.updateCartItem(widget.item, _itemCount);
      }

      return Container(
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.all(2),
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: ListTile(
            leading: Image.asset(
              item.image,
              height: MediaQuery.of(context).size.height *
                  0.2, // Adjust based on screen size
              width: MediaQuery.of(context).size.width * 0.2,
            ), // Adjust based on screen size),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name, // Ürün adı
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  "N.F: ${widget.item.normalPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                  ),
                ), // Normal fiyatı
                Text(
                  "K.F: ${widget.item.discountedPrice.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 14),
                ), // Kampanyalı fiyatı
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: decreaseCountFromCart,
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
                      _itemCount.toString(), // Ürün sayısı
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: increaseCountFromCart,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: widget.item.count < widget.item.stock
                          ? Colors.white
                          : const Color.fromARGB(255, 215, 214, 214),
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
    });
  }
}
