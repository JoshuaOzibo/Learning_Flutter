import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/learn_flutter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context){
                  return const LearnFlutterPage();
                } )
            );
          }, 
          
          child: Text('Learn Flutter')),
      ),
    );
  }
}