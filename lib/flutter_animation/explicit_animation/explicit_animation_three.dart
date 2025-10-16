import 'package:flutter/material.dart';

class ExplicitAnimationThree extends StatefulWidget {
  const ExplicitAnimationThree({super.key});

  @override
  State<ExplicitAnimationThree> createState() => _ExplicitAnimationThreeState();
}

class _ExplicitAnimationThreeState extends State<ExplicitAnimationThree>
    with SingleTickerProviderStateMixin {
  final double progress = 0.95;
  final double plankProgress = 300;
  late AnimationController controller;
  late Animation<double> animateProgress;
  late Animation<double> animatePlank;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    animateProgress = Tween<double>(
      begin: 0.0,
      end: progress,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    animatePlank = Tween<double>(
      begin: 0,
      end: plankProgress,
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            AnimatedBuilder(
              animation: animateProgress,
              builder: (context, child) => Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      value: animateProgress.value,
                      backgroundColor: Colors.grey.shade200,
                      strokeWidth: 10,
                      color: Colors.amber,
                    ),
                  ),

                  Text(
                    '${(animateProgress.value * 100).toInt()}%',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(
                  width: 300,
                  height: 15,
                  child: Container(color: Colors.grey.shade200),
                ),

                AnimatedBuilder(
                  animation: animatePlank,
                  builder: (context, child) => Stack(
                    alignment: Alignment.topRight,
                    children: [
                      SizedBox(
                        width: animatePlank.value,
                        height: 15,
                        child: Container(color: Colors.blue),
                      ),

                      Text(
                        '${((animatePlank.value / plankProgress) * 100).toInt()}%',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(controller.isCompleted){
            controller.reverse();
          }else{
            controller.forward();
          }
        },
        child: Text('Click'),
      ),
    );
  }
}
