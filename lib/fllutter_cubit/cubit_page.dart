import 'package:flutter/material.dart';
import 'package:flutter_application_1/fllutter_cubit/cubit_vm.dart';
import 'package:flutter_application_1/fllutter_cubit/text_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CubitPage extends StatefulWidget {
  const CubitPage({super.key});

  @override
  State<CubitPage> createState() => _CubitPageState();
}

class _CubitPageState extends State<CubitPage> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void handleAdd() {
    context.read<CubitVm>().addToList(textController.text.trim());
    print(textController.text);
    textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          TextInput(textController: textController, handleAdd: handleAdd),
          SizedBox(height: 100),
          BlocBuilder<CubitVm, List<String>>(
            builder: (_, state) {
              return SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (_, index) => ListTile(title: Text('${state[index]}')),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
