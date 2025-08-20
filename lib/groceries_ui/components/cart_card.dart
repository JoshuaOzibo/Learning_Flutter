import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey[200], // light gray background
            padding: const EdgeInsets.all(
              10,
            ), // optional, gives spacing around image
            child: Image.asset(
              image,
              height: 80,
              fit: BoxFit.contain, // keep image inside
            ),
          ),

          Column(
            children: [
              Row(
                children: [
                  Text('Tomato'),
                  Text(
                    "×",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('\u20A65000'),

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
            ],
          ),
        ],
      ),
    );
  }
}
