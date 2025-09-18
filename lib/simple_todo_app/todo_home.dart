import 'package:flutter/material.dart';
import 'package:flutter_application_1/simple_todo_app/favourite_todo_item.dart';
import 'package:flutter_application_1/simple_todo_app/todo_card.dart';
import 'package:flutter_application_1/simple_todo_app/todo_form.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final todoItem = ['Work'];
  final favoriteItems = [];
  late String alreadyExist = '';
  void onPressAdd(String newTodo) {
    setState(() {
      todoItem.add(newTodo);
    });
  }

  void onDeleteTodo(String name) {
    setState(() {
      todoItem.removeWhere((test) => test == name);
    });
  }

  void onFavoriteSelected(String favriteText) {
    setState(() {
      if (favoriteItems.contains(favriteText)) {
        print(alreadyExist);
        alreadyExist = favriteText;
      } else {
        print(alreadyExist);
        favoriteItems.add(favriteText);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          spacing: 10,
          children: [
            TodoForm(onSubmit: onPressAdd),
            SizedBox(height: 20),
            ...todoItem.map(
              (item) => TodoCard(
                text: item,
                tapFavriteButton: (value) => onFavoriteSelected(value),
                tapDeleteButton: ((item) => onDeleteTodo(item)),
              ),
            ),
            SizedBox(height: 40),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Favorite Todo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.heart_broken),
                  ],
                ),
                SizedBox(height: 20),
                if (favoriteItems.isEmpty)
                  Center(
                    child: Text(
                      'Favrite item is empty',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                if (favoriteItems.isNotEmpty)
                  ...favoriteItems.map(
                    (item) => FavouriteTodoItem(favrite: item),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
