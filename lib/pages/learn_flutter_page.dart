import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isboolVal = false;
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Learn Flutter '),
        // automaticallyImplyLeading: false, // this is use to automatically hide automaticallyImplyLeading
        // lets create out own leading
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/learningImage.png"),
            SizedBox(height: 20),
            const Divider(color: Colors.black),
            Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10.0),
              // decoration: ,
              color: Colors.blue,
              child: const Center(child: Text("Hello from my container")),
            ),
        
            // types of button
            ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //  textStyle: TextStyle(background: )
              // ),
              onPressed: () {
                print(" Elevated Button Pressed");
              },
              child: const Text(
                'Hello elevated button',
                style: TextStyle(color: Colors.amber),
              ),
            ),
        
            SizedBox(height: 50),
        
            Switch(
              value: isboolVal,
              onChanged: (bool newBool) {
                setState(() {
                  isboolVal = newBool;
                });
              },
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            
              children: [
                Icon(Icons.fireplace),
                Text('Hello from row', style: TextStyle(color: Colors.blue)),
                Icon(Icons.fireplace),
              ],
            ),
        
            Checkbox(
              value: isChecked, 
              onChanged: (bool? check){
                setState(() {
                  isChecked = check;
                });
              }),
        
        
              Image.asset("images/learningImage.png"),
          ],
        ),
      ),
    );
  }
}
