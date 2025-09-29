import 'package:flutter/material.dart';
import 'package:flutter_application_1/simple_cart/cart_page.dart';
import 'package:flutter_application_1/simple_cart/cart_home.dart';

class SimpleCart extends StatefulWidget {
  const SimpleCart({super.key});

  @override
  State<SimpleCart> createState() => _SimpleCartState();
}

class _SimpleCartState extends State<SimpleCart> {
  int currentPageIndex = 0;

  final pages = [CartHome(), SimplrCartPage()];

  void handlePageChange(value) {
    setState(() {
      currentPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: pages[currentPageIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (e) => handlePageChange(e),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
