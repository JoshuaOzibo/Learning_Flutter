import 'package:flutter/material.dart';
import 'package:flutter_application_1/groceries_ui/components/select_grocery.dart';

class GroceryUi extends StatelessWidget {
  const GroceryUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
      // appBar: AppBar(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 239, 239),
        leadingWidth: 100,
        leading: Container(
          // color: Colors.blue,
          padding: EdgeInsets.only(left: 10),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text('Abuja Nigeria'),
          ),
        ),
        actions: [
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(5),
            child: Icon(Icons.search),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(5),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),

      // body: Container
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // default color
                ),
                children: [
                  TextSpan(text: 'Fresh '),
                  TextSpan(
                    text: 'Groceries',
                    style: TextStyle(color: Colors.orange),
                  ),
                  TextSpan(text: ', Zero Hassel'),
                ],
              ),
            ),

            SizedBox(height: 20),

            // card
            Container(
              height: 200,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Fruits',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Vegetables',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            // SelectGrocery(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SelectGrocery(filterBy: 'All'),
                  SelectGrocery(filterBy: 'Vegetables'),
                  SelectGrocery(filterBy: 'Fruits'),
                  SelectGrocery(filterBy: 'Meat'),
                  SelectGrocery(filterBy: 'Bakery'),
                  SelectGrocery(filterBy: 'Dairy'),
                  SelectGrocery(filterBy: 'Snacks'),
                  SelectGrocery(filterBy: 'Beverages'),
                  SelectGrocery(filterBy: 'Frozen'),
                  SelectGrocery(filterBy: 'Seafood'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
