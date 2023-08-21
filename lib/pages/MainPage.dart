import 'package:flutter/material.dart';

import '../widgets/Products.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 238, 239),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 233, 238, 239),
        leading: IconButton(
          icon: const Icon(
            Icons.home,
            size: 40,
          ),
          onPressed: () {},
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "GULSOY.HOME",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 8.0, left: 10),
            child: Text(
              "Arama Sonuçları",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Ara...",
                      icon: Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: const Icon(Icons.zoom_in),
                width: 50,
                height: 50,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  child: Icon(Icons.ac_unit),
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Products();
                },
              ),
            ),
          ),
          Container(
            color: Colors.brown,
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Sepete Git",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
