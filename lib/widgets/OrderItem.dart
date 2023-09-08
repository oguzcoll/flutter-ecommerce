import 'package:flutter/material.dart';
import 'package:hepsiorda/pages/order_detail_page.dart';
import 'package:hepsiorda/pages/customers.dart';
import 'package:hepsiorda/utils/order_data_list.dart';

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
            Expanded(
              child: Column(
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
            ),
            Expanded(
              child: Column(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          0.0), // Set button border radius to 0
                    ),
                  ),
                ),
                child: const Text("Bekleyen"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          0.0), // Set button border radius to 0
                    ),
                  ),
                ),
                child: Text("Sipariş"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
