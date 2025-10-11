import 'package:flutter/material.dart';

class AnimationTwo extends StatefulWidget {
  const AnimationTwo({super.key});

  @override
  State<AnimationTwo> createState() => _AnimationTwoState();
}

class _AnimationTwoState extends State<AnimationTwo> {
  bool isAnimated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAnimated = !isAnimated;
                    print(isAnimated);
                  });
                },
                child: AnimatedContainer(
                  width: isAnimated ? 150 : 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: isAnimated
                        ? BorderRadius.circular(100)
                        : BorderRadius.circular(10),
                    color: isAnimated == true ? Colors.blue : Colors.red,
                  ),
                  duration: const Duration(milliseconds: 500),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (!isAnimated) Icon(Icons.add),
                        AnimatedOpacity(
                          opacity: isAnimated ? 1 : 0,
                          duration: const Duration(milliseconds: 2500),
                          child: Text(
                            isAnimated ? 'Animated data' : '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              
            ],
          ),
        ),
      ),
    );
  }
}
