import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/profile_card.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
// import 'package:flutter_application_1/currency_converter_materia_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_application_1/groceries_ui/grocery_ui.dart';
// import 'package:flutter_application_1/shopping_app/screens/shopping_app.dart';

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
        theme: ThemeData(
          primarySwatch: Colors.green
        ),

        home: const GroceryUi(), // HomePage(), // ProfileCard(), // CurrencyConverterMateriaPage(), // ShoppingApp(),
      );
    }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  int currentPage = 0;
  int count = 0;

  List<Widget> pages = const [
    HomePage(),
    ProfilePage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        
        title: Text("Flutter", style: TextStyle(color: Colors.white),),
      ),

      body: pages[currentPage],

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => setState(() {
          count++;
        }),
        child: const Icon(Icons.add, color: Colors.white,),
      ),

      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],

        onDestinationSelected: (int index) => {
            setState(() {
              currentPage = index;
            }),
        },
        

        selectedIndex: currentPage,
        ),
    );
  }
}

// CurrencyConverterMateriaPage(),