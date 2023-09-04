import 'package:flutter/material.dart';
import 'package:hepsiorda/pages/main_page.dart';
import 'package:hepsiorda/pages/pending_order_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Color> cardColors = [
    Colors.red.withOpacity(0.8),
    Colors.blue.withOpacity(0.8),
    Colors.purple.withOpacity(0.8),
    Colors.orange.withOpacity(0.8),
    Colors.green.withOpacity(0.8),
    Colors.indigo.withOpacity(0.8),
    Colors.yellow.withOpacity(0.8),
    Colors.cyan.withOpacity(0.8),
    Colors.pink.withOpacity(0.8),
  ];

  final List<String> cardNames = [
    "Katalog",
    "Müşteri",
    "Müşteri Ekle",
    "Bekleyen Sipariş",
    "Reddedilen Sipariş",
    "Onaylanan Sipariş",
    "Aktarılan Sipariş",
    "Sepete Git",
    "Çıkış",
  ];

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width < 300 ? 2 : 3;
    double childAspectRatio = MediaQuery.of(context).size.width < 600
        ? 2 / 1.6
        : 2 / 1; // Adjusted childAspectRatio

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 238, 239),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Content in the same row
              MediaQuery.of(context).size.width < 600
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "GÜLSOY.HOME",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Text(
                          "Gülsoy Home Sipariş Uygulaması",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text("Aktif Kullanıcı: gulsoy"),
                        Text("Aktif Müşteri: ÖMER FARUK YÜKSELEN"),
                        Text("Version: 1.1"),
                      ],
                    )
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "GÜLSOY.HOME",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Text(
                              "Gülsoy Home Sipariş Uygulaması",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Aktif Kullanıcı: gulsoy"),
                            Text("Aktif Müşteri: ÖMER FARUK YÜKSELEN"),
                            Text("Version: 1.1"),
                          ],
                        ),
                      ],
                    ),

              // textfield
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
                            hintText: "Ürün Ara",
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
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: Icon(Icons.zoom_in_map_outlined),
                    width: 60,
                    height: 60,
                    color: Colors.red,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              // grid items
              Expanded(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    double textSize = MediaQuery.of(context).size.width < 600
                        ? 13.0
                        : 18.0; // Adjusted text size
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        }
                        if (index == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PendingOrderScreen()),
                          );
                        }
                      },
                      child: Card(
                        elevation: 2,
                        color: cardColors[index],
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                cardNames[index],
                                style: TextStyle(fontSize: textSize),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
