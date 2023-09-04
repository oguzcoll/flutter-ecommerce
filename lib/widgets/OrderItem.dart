import 'package:flutter/material.dart';
import 'package:hepsiorda/pages/pending_order_page.dart';

class OrderItem extends StatefulWidget {
  final OrderData customerData;
  const OrderItem({super.key, required this.customerData});

  @override
  State<OrderItem> createState() {
    return _OrderItemState();
  }
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0), // Set border radius to 0
        ),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Align items vertically in the center
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Müşteri Adı",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  widget.customerData.customerName,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Müşteri Tel No",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  widget.customerData.phoneNumber.toString(),
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("incele"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        0.0), // Set button border radius to 0
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Sipariş"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        0.0), // Set button border radius to 0
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
