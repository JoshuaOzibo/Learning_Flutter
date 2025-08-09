import 'package:flutter/material.dart';
// import 'package:flutter_application_1/currency_converter_materia_page.dart';
import 'package:flutter_application_1/weather_app/weather_app_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_application_1/forms/form_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Load environment variables from .env file
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}


// types of widgets
// StatelessWidget: Immutable, cannot change state after creation.
// StatefulWidget: Mutable, can change state during its lifetime.
// InheritedWidget: Used for sharing data across the widget tree.

// two types of design pattern
// Materia Design
// StatefulWidget


class MyApp extends StatelessWidget {
    const MyApp({super.key});
    

    @override
    Widget build(BuildContext context){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true).copyWith(
            // customizing the app bar
          ),
            home: Scaffold(
                body: FormWidget(),
            ),
        );
    }
}

// CurrencyConverterMateriaPage(),