import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductsState();
  }
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white70,
          border: Border.all(color: Colors.white, width: 2)),
      child: Column(
        children: [
          Image.asset(
            'lib/assets/image1.png',
            height: 90,
            width: 90,
          )
        ],
      ),
    );
  }
}
