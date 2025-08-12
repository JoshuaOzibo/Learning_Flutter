import 'package:flutter/material.dart';
void main() {
  runApp(ShoppingApp());
}


class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        // Customize the app bar or other theme properties here if needed
      ),
      home: Scaffold(
        // appBar: AppBar(
          
        //   ),

        // ),
        body: Center(
          
        )
      )
    
    );
  }
}


