import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blueGrey.shade900,
                Colors.black87,
              ],
            ),
          ),
          child: Center(
            child: Text(
              'Welcome to Shopping App',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),  
          
        )
      )
    
    );
  }
}


