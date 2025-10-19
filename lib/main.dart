import 'package:flutter/material.dart';
import 'package:flutter_application_1/converter.dart';
import 'package:flutter_application_1/currency_converter_materia_page.dart';
import 'package:flutter_application_1/flutter_animation/custom_painter_animation/bouncing_ball_animation.dart';
import 'package:flutter_application_1/flutter_animation/explicit_animation/explicit_animation_one.dart';
import 'package:flutter_application_1/flutter_animation/explicit_animation/explicit_animation_three.dart';
import 'package:flutter_application_1/flutter_animation/explicit_animation/explicit_animation_two.dart';
import 'package:flutter_application_1/flutter_animation/implicit_animation/animated_crossfade.dart';
import 'package:flutter_application_1/flutter_animation/implicit_animation/animation_one.dart';
import 'package:flutter_application_1/flutter_animation/implicit_animation/animation_three.dart';
import 'package:flutter_application_1/flutter_animation/implicit_animation/animation_two.dart';
import 'package:flutter_application_1/flutter_animation/implicit_animation/rotation_animation.dart';
import 'package:flutter_application_1/flutter_animation/page_route_animations/splash_animation.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_page.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/provider/todo_provider.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_db_model.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_home_page.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/person.dart';
import 'package:flutter_application_1/practicingMaping/noteHomePage/note_home_page.dart';
import 'package:flutter_application_1/practicingMaping/noteHomePage/note_provider.dart';
import 'package:flutter_application_1/practicingMaping/task_one/note_app_db_model.dart';
import 'package:flutter_application_1/simple_cart/repositories/product_repository.dart';
import 'package:flutter_application_1/simple_cart/simple_cart.dart';
import 'package:flutter_application_1/simple_cart/viewmodel/hive/product.dart';
import 'package:flutter_application_1/simple_cart/viewmodel/product_viewmodel.dart';
import 'package:flutter_application_1/simple_todo_app/todo_form.dart';
import 'package:flutter_application_1/simple_todo_app/todo_home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter(PersonAdapter());
  Hive.registerAdapter(NoteAppDbModelAdapter());
  Hive.registerAdapter(TodoDbModelAdapter());
  await Hive.openBox<NoteAppDbModel>('noteBox');
  await Hive.openBox<TodoDbModel>('todoBox');
  // NoteProvider().loadBoxFunc();
  // Hive.registerAdapter(ProductAdapter());
  // Hive.registerAdapter(HiveTodoModelAdapter());
  // await Hive.openBox<Product>('cartProduct');
  // await Hive.openBox<HiveTodoModel>('todoStorage');

  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductViewmodel()),
        ChangeNotifierProvider(create: (context) => NoteProvider()),
        ChangeNotifierProvider(create: (context) => TodoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // //HivePage() //const SimpleCart() //  HiveTodoPage() //NoteHomePage() //TodoHomePage()
    return MaterialApp(home: BouncingBallAnimation());
  }
}
