import 'package:flutter/material.dart';
import 'package:flutter_application_1/converter.dart';
import 'package:flutter_application_1/currency_converter_materia_page.dart';
import 'package:flutter_application_1/simple_cart/simple_cart.dart';
import 'package:flutter_application_1/simple_todo_app/todo_form.dart';
import 'package:flutter_application_1/simple_todo_app/todo_home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('testBox');
  
  await box.put(1, 'hello');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SimpleCart());
  }
}
