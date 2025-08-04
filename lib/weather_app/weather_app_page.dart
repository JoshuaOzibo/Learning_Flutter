import 'package:flutter/material.dart';

void main () {}

class WeatherAppPage extends StatelessWidget {
    const WeatherAppPage({super.key});

    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Text('Welcome to the Weather App!'),
      ),
    );
  }
}