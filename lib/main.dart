import 'package:flutter/material.dart';
import 'package:flutter_application_1/converter.dart';
import 'package:flutter_application_1/currency_converter_materia_page.dart';
import 'package:flutter_application_1/hive/hive_page.dart';
import 'package:flutter_application_1/hive/person.dart';
import 'package:flutter_application_1/simple_cart/repositories/product_repository.dart';
import 'package:flutter_application_1/simple_cart/simple_cart.dart';
import 'package:flutter_application_1/simple_cart/viewmodel/hive/product.dart';
import 'package:flutter_application_1/simple_cart/viewmodel/product_viewmodel.dart';
import 'package:flutter_application_1/simple_todo_app/todo_form.dart';
import 'package:flutter_application_1/simple_todo_app/todo_home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox<Product>('cartProduct');
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ProductViewmodel()),
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { // //HivePage()
    return MaterialApp(home: const SimpleCart());
  }
}
