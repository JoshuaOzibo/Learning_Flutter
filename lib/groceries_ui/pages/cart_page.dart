import 'package:flutter/material.dart';
import 'package:flutter_application_1/groceries_ui/components/cart_card.dart';
import 'package:flutter_application_1/groceries_ui/components/order_summary.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        title: Center(
          child: Text(
            "Cart",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 239, 239, 239),
        toolbarHeight: 70,
        leadingWidth: 68,
        leading: Center(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
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
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.shopping_cart),
              color: Colors.black,
            ),
          ),
        ],
      ),

      // body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CartCard(image: 'images/carrot.png'),
                CartCard(image: 'images/tomato.png'),

                // coupon input
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "Enter Discount Code",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    suffixIcon: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              40,
                              100,
                              43,
                            ),
                            // elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Apply",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // order summary
                SizedBox(height: 30),
                OrderSummary(),
                SizedBox(height: 30),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 35),
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
        ],
      ),
    );
  }
}
