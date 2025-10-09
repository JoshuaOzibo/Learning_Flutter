import 'package:flutter/material.dart';

class ExplicitAnimationOne extends StatefulWidget {
  const ExplicitAnimationOne({super.key});

  @override
  State<ExplicitAnimationOne> createState() => _ExplicitAnimationOneState();
}

class _ExplicitAnimationOneState extends State<ExplicitAnimationOne> with SingleTickerProviderStateMixin {
 late Animation<double> logoFadeOpacity;
 late AnimationController controller;
 late Animation<Offset> slideAnimation;
 late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2500));
    logoFadeOpacity = Tween<double>(begin: 0, end: 1).animate(controller);
    slideAnimation = Tween<Offset>(begin: Offset(-1, -1), end: Offset.zero).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    scaleAnimation = Tween<double>(begin: -0.8, end: 1.5).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    slideAnimation.addListener((){
    //  if(slideAnimation.isCompleted){
      controller.repeat();
    //  }
    });
    controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 100),
              child: FadeTransition(
                opacity: logoFadeOpacity,
                child: SizedBox(
                  height: 300,
                  child: Icon(
                    Icons.baby_changing_station,
                    size: 100,
                    )),
              ),
            ),
            Center(
              child: ScaleTransition(
                scale: scaleAnimation,
                child: SlideTransition(
                  position: slideAnimation,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepOrangeAccent,
                          blurRadius: 130,
                          spreadRadius: 80,
                          offset: Offset.fromDirection(1.5)
                        )
                      ]
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}