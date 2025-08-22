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

          // Fruits / Vegetables card
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 240, 105),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Align(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 3,
                                bottom: 3,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 192, 255, 114),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '25% Discount',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Shop fresh, Eat well, Live better.',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.orange, // Button background color
                                foregroundColor:
                                    Colors.white, // Text/Icon color
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    6,
                                  ), // Rounded corners
                                ),
                                elevation: 3, // Shadow effect
                              ),
                              child: const Text(
                                'Shop Now',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Image.asset(
                          'images/cucumba.png',
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Horizontal scroll for grocery filters
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

          //Section header
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
                    Text('See All', style: TextStyle(color: Colors.black)),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Grid of groceries
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              PopularGrocery(
                image: 'images/tomato.png',
                groceryName: 'Tomanto',
                price: '₦20,000',
                rating: '4.2',
              ),
              PopularGrocery(
                image: 'images/carrot.png',
                groceryName: 'Carrot',
                price: '₦25,000',
                rating: '4.5',
              ),
              PopularGrocery(
                image: 'images/cucumba.png',
                groceryName: 'Cucumba',
                price: '₦18,000',
                rating: '3.8',
              ),
              PopularGrocery(
                image: 'images/meat.png',
                groceryName: 'Stake',
                price: '₦30,000',
                rating: '4.7',
              ),
              PopularGrocery(
                image: 'images/tomato.png',
                groceryName: 'Tomanto',
                price: '₦10,000',
                rating: '4.1',
              ),
              PopularGrocery(
                image: 'images/carrot.png',
                groceryName: 'Carrot',
                price: '₦15,000',
                rating: '4.7',
              ),
            ],
          ),

          // bottom Bar
          SizedBox(height: 20),

          // BottomAppBar()
        ],
      ),

      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.category), label: 'Category'),
          NavigationDestination(
            icon: Icon(Icons.heart_broken),
            label: 'Favourite',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
