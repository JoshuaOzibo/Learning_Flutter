import 'package:flutter/material.dart';

class ExplicitAnimationOne extends StatefulWidget {
  const ExplicitAnimationOne({super.key});

  @override
  State<ExplicitAnimationOne> createState() => _ExplicitAnimationOneState();
}

class _ExplicitAnimationOneState extends State<ExplicitAnimationOne>
    with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;
  late Animation<Offset> slideTransition;
  late Animation<Offset> circleSlideTransition;
  late Animation<double> circleScaleTransition;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    opacity = Tween<double>(begin: 0, end: 1).animate(controller);
    slideTransition = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    // slide circle
    circleSlideTransition = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    // scale circle
    circleScaleTransition = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    circleSlideTransition.addListener((){
      if(controller.status.isCompleted){
        // controller.repeat();
        controller.reverse();
      }
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
            child: SlideTransition(
              position: slideTransition,
              child: FadeTransition(
                opacity: opacity,
                child: SizedBox(
                  height: 300,
                  child: Icon(Icons.baby_changing_station, size: 100),
                ),
              ),
            ),
          ),
          SlideTransition(
            position: circleSlideTransition,
            child: Center(
              child: ScaleTransition(
                scale: circleScaleTransition,
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
                        offset: Offset.fromDirection(1.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
