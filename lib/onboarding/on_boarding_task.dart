import 'package:flutter/material.dart';

class OnBoardingTask extends StatefulWidget {
  const OnBoardingTask({super.key});

  @override
  State<OnBoardingTask> createState() => _OnBoardingTaskState();
}

class _OnBoardingTaskState extends State<OnBoardingTask> {
  int currentSlideCount = 0;
  final PageController _pageController = PageController();
  List<Widget> boardingPages = [
    FirstSlide(),
    SecondSlide(),
    ThirdSlide(),
    FourthSlide(),
    FifthSlide(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            ),

            child: LayoutBuilder(
              builder: (context, constrains) {
                double progressWidth =
                    (constrains.maxWidth / boardingPages.length) *
                    (currentSlideCount + 1);
                return Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: progressWidth,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  print(value);
                  currentSlideCount = value;
                });
              },
              itemCount: boardingPages.length,
              itemBuilder: (_, index) {
                return boardingPages[index];
              },
            ),
          ),

          MaterialButton(
            color: Colors.blue,
            minWidth: double.infinity,
            child: Text('Continue'),
            onPressed: () => setState(() {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              currentSlideCount + 1;
            }),
          ),
        ],
      ),
    );
  }
}

class FirstSlide extends StatelessWidget {
  const FirstSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(text: TextSpan(
            children: [
              TextSpan(text: 'Boarding'),

                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: EditText(text: 'One'), style: TextStyle(fontSize: 20)),
            ]
          ))
          // Text('Boarding ${EditText(text: 'One')}', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class SecondSlide extends StatelessWidget {
  const SecondSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Boarding Two', textAlign: TextAlign.center)],
      ),
    );
  }
}

class ThirdSlide extends StatelessWidget {
  const ThirdSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Boarding Three', textAlign: TextAlign.center)],
      ),
    );
  }
}

class FourthSlide extends StatelessWidget {
  const FourthSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Boarding Four', textAlign: TextAlign.center)],
      ),
    );
  }
}

class FifthSlide extends StatelessWidget {
  const FifthSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Boarding Five', textAlign: TextAlign.center)],
      ),
    );
  }
}

class EditText extends StatelessWidget {
  const EditText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
  children: [
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    ),

    Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    ),
  ],
);
  }
}

