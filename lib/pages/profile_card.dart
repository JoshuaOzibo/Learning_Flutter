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
                left: (MediaQuery.of(context).size.width / 2) - 75, // center horizontally
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
        ],
        Center(
            child: Text("Nife Samuel",
            style: TextStyle(color: Colors.amber),
            
            ),
          )
      ),

      
    );
  }
}
