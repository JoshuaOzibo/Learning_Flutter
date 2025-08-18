import 'package:flutter/material.dart';
import 'package:flutter_application_1/groceries_ui/components/popular_grocery.dart';
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
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          // 🟠 Heading
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
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

          // 🟢 Fruits / Vegetables card
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Fruits', style: TextStyle(fontSize: 18)),
                      ),
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
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Vegetables',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // 🟣 Horizontal scroll for grocery filters
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

          SizedBox(height: 20),

          // 🔵 Section header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Groceries',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text('See All'),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ],
          ),

          // 🔴 Grid of groceries
          GridView.count(
            crossAxisCount: 2, // 2 items per row
            shrinkWrap: true, // ✅ ensures grid takes only needed height
            physics: NeverScrollableScrollPhysics(), // ✅ no nested scrolling
            crossAxisSpacing: 10, // ✅ spacing between columns
            mainAxisSpacing: 10, // ✅ spacing between rows
            children: [
              PopularGrocery(),
              PopularGrocery(),
              PopularGrocery(),
              PopularGrocery(),
              PopularGrocery(),
              PopularGrocery(),
              PopularGrocery(),
              PopularGrocery(),
            ],
          ),
        ],
      ),
    );
  }
}
