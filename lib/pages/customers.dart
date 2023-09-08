import 'package:flutter/material.dart';
import 'package:hepsiorda/utils/order_data_list.dart';
import 'package:hepsiorda/widgets/OrderItem.dart';

class PendingOrderScreen extends StatefulWidget {
  const PendingOrderScreen({super.key});

  @override
  State<PendingOrderScreen> createState() {
    return _PendingOrderScreenState();
  }
}

class _PendingOrderScreenState extends State<PendingOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 238, 239),
      appBar: AppBar(
        title: const Text(
          "MÜŞTERİ",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(189, 225, 224, 224),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Müşteri adı",
                        icon: Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Icon(Icons.search),
                width: 60,
                height: 60,
                color: Colors.grey,
              ),
            ],
          ),

          // LİSTİLE
          Expanded(
            child: ListView.builder(
                itemCount: orderDataList.length,
                itemBuilder: (ctx, index) {
                  return OrderItem(
                    customerData: orderDataList[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class OrderData {
  final String customerName;
  final String phoneNumber;

  OrderData({required this.customerName, required this.phoneNumber});
}
