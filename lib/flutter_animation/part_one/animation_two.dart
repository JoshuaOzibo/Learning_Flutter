import 'package:flutter/material.dart';

class AnimationTwo extends StatefulWidget {
  const AnimationTwo({super.key});

  @override
  State<AnimationTwo> createState() => _AnimationTwoState();
}

class _AnimationTwoState extends State<AnimationTwo> {

  bool isExpanded = false;

  void handleBtnChange(){
    setState(() {
      isExpanded = !isExpanded;
    });

    print(isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Center(
            child: GestureDetector(
              onTap: handleBtnChange,
              child: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 1000
                ),
                width: isExpanded ? 200 : 100,
                height: 50,
                decoration: BoxDecoration(
                color: isExpanded ? Colors.green : Colors.blue,
                borderRadius: isExpanded ? BorderRadius.circular(100) : BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Icon(isExpanded ? Icons.book : Icons.card_giftcard, color: isExpanded ? Colors.amber : Colors.white,),
                    AnimatedOpacity(
                      opacity: isExpanded ? 1 : 0,
                      duration: const Duration(
                        milliseconds: 1500
                      ),
                      child: Text(isExpanded ? 'Added to cart' : 'Cart', style: TextStyle(
                        color: Colors.white,
                      ),),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}