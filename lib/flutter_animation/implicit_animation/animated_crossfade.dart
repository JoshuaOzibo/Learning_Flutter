import 'package:flutter/material.dart';

class AnimatedCrossfade extends StatefulWidget {
  const AnimatedCrossfade({super.key});

  @override
  State<AnimatedCrossfade> createState() => _AnimatedCrossfadeState();
}

class _AnimatedCrossfadeState extends State<AnimatedCrossfade> {
  List<String> buttonList = ['Buy Airtime', 'Buy Cable'];

  String isSelected = 'Buy Airtime';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Row(
                spacing: 10,
                children: [
                  ...buttonList.map(
                    (item) => Expanded(
                      child: SizedBox(
                        height: 50,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = item;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                              color: isSelected == item
                                  ? Colors.brown
                                  : Colors.cyan,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(item),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            AnimatedCrossFade(
              firstChild: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.yellow),
                child: Center(
                  child: Text('Airtime', style: TextStyle(fontSize: 30)),
                ),
              ),
              secondChild: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.yellow),
                child: Center(
                  child: Text('Cable', style: TextStyle(fontSize: 30)),
                ),
              ),
              crossFadeState: isSelected == 'Buy Airtime'
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 500),
            ),
          ],
        ),
      ),
    );
  }
}
