import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profile_page.dart';

class ExplicitAnimationTwo extends StatefulWidget {
  const ExplicitAnimationTwo({super.key});

  @override
  State<ExplicitAnimationTwo> createState() => _ExplicitAnimationTwoState();
}

class _ExplicitAnimationTwoState extends State<ExplicitAnimationTwo>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late List<Animation<Offset>> slidingAnimation;

  final int itemLength = 5;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(
      milliseconds: 2000
    ));

    slidingAnimation = List.generate(itemLength, (index) => Tween<Offset>(
      begin: Offset(-2, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(index * (1 / itemCount), 1))));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: List.generate(
                itemLength,
                (index) => SlideTransition(
                  position: slidingAnimation[index],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Hello to List Animation'),
                      shape: BeveledRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.brown),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // SizedBox(height: 100),

          MaterialButton(
            onPressed: (){
              if(controller.isCompleted){
                controller.reverse();
              }
              controller.forward();
            },
            child: Text('start animation'),
          ),
        ],
      ),
    );
  }
}
