import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with TickerProviderStateMixin {
  final double progress = 1;
  late AnimationController controller;
  late AnimationController scaleController;
  late Animation<double> progressAnimation;
  late Animation<double> scaleTransit;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    scaleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));

    // animation
    progressAnimation = Tween<double>(
      begin: 0.0,
      end: progress,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    scaleTransit = Tween<double>(
      begin: 0,
      end: 5,
    ).animate(CurvedAnimation(parent: scaleController, curve: Curves.easeOut));

    controller.addListener(() {
      if (controller.isCompleted) {
        scaleController.forward();
      }
    });

    scaleController.addListener((){
      if(scaleController.isCompleted){
        Navigator.of(context).push(
          PageRouteBuilder(pageBuilder: (context, animatiom, secondaryAnimation) {
            return const Destination();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final anim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));
            return FadeTransition(
              opacity: anim,
              child: child,
              );
          },
          ));
      Timer(const Duration(milliseconds: 500), (){
        scaleController.reset();
        controller.reset();
      });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: progressAnimation,
          builder: (context, widget) {
            return controller.isCompleted
                ? ScaleTransition(
                    scale: scaleTransit,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: CircularProgressIndicator(
                          value: progressAnimation.value,
                          strokeWidth: 10,
                          color: Colors.amber,
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ),

                      Text('${(progressAnimation.value * 100).toInt()}%'),
                    ],
                  );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        child: Text('Click'),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('Hello Destination'),
      ),

      body: Center(
        child: Text('Destination'),
      ),
    );
  }
}
