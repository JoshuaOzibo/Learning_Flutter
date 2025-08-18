import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Positioned(
                left:
                    (MediaQuery.of(context).size.width / 2) -
                    75, // center horizontally
                bottom: -75, // overflow below the card
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    image: DecorationImage(
                      image: AssetImage("images/learningImage.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(500)),
                    border: Border.all(width: 5, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 90),
          Center(
            child: Text(
              "Nife Samuel",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Center(
            child: Text(
              "Product Designer",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 10),

          SizedBox(height: 2, width: 300, child: ColoredBox(color: Colors.red)),
          SizedBox(height: 10),
          Center(
            child: Container(
              margin: EdgeInsetsDirectional.only(start: 80, end: 80),
              child: Text(
                "Profile Card UI ... Just completed an incredible project! I'm excited to share this with you all, as it could be a valuable resource for your website or mobile .. by chisom • Free.",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          SizedBox(height: 10),

          Center(
            child: Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_balance_wallet, size: 30, color: Colors.red),
                Icon(Icons.account_balance_wallet, size: 30, color: Colors.red),
                Icon(Icons.account_balance_wallet, size: 30, color: Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// 
