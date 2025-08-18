import 'package:flutter/material.dart';

class GroceryUi extends StatelessWidget {
  const GroceryUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 239, 239),
        leadingWidth: 100,
        leading: Container(
          color: Colors.blue,
          // padding: EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Abuja Nigeria'),
          ),
        ),
        actions: [
          Container(
            color: Colors.blue,
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(5),
            child: Icon(Icons.search)),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(5),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}
