import 'package:flutter/material.dart';

void main () {}

class WeatherAppPage extends StatelessWidget {
    const WeatherAppPage({super.key});

    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App', style: TextStyle(fontSize: 24,),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        // toolbarHeight: 100, // Uncomment to set a custom height for the app bar
        
      ),
      body: Center(
        child: Text('Welcome to the Weather App!'),
      ),
    );
  }
}