import 'dart:math';

import 'package:flutter/material.dart';

class SelecteditemPage extends StatelessWidget {
  const SelecteditemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 239, 239),
        toolbarHeight: 70, // to add height to the Appbar
        leadingWidth: 68,
        leading: Center(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.black,
            ),
          ),
        ),

        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 5),
            Center(child: Image.asset('images/meat.png')),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tomatoes',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Fresh Juicy, Locally scurood ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Icon(Icons.heart_broken_outlined, size: 28),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 239, 239, 239),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 10,
                      ),
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [Icon(Icons.star), Text('4.6')]),
                              Text('Rating'),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.car_crash),
                                  Text('4 hrs'),
                                ],
                              ),
                              Text('Delivery'),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [Icon(Icons.person), Text('3k +')]),
                              Text('Overview'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15),
                    // description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'This product is designed with high quality standards, '
                          'offering durability, style, and comfort. Perfect for everyday use, '
                          'it combines modern design with practical functionality to suit your needs.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color.fromARGB(
                            255,
                            184,
                            184,
                            184,
                          ), // your border color
                          width: 0.6, // border thickness
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 3,
                            children: [
                              Text(
                                '\u20A620,000',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  color: const Color.fromARGB(
                                    255,
                                    162,
                                    162,
                                    162,
                                  ),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: const Color.fromARGB(
                                    255,
                                    164,
                                    164,
                                    164,
                                  ),
                                ),
                              ),
                              Text(
                                '\u20A65,000',
                                style: TextStyle(
                                  fontFamily: 'Roveto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                spacing: 8,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                  ), // Icon widget
                                  Text('1'),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    width: 0.5,
                    color: const Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
              ),

              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    // small rounded corners
                    // border
                  ),
                  backgroundColor: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
