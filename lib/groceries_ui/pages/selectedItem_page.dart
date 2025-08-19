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
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 10,
                      ),
                      height: 80,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Row(children: [Icon(Icons.star), Text('4.6')]),
                              Text('Rating'),
                            ],
                          ),
                          Column(
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
                            children: [
                              Row(children: [Icon(Icons.person), Text('3k +')]),
                              Text('Overview'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
