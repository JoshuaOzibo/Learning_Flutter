import 'package:flutter/material.dart';
import 'package:flutter_application_1/flutter_bloc/bloc_vm/bloc_vm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FlutterBloc extends StatelessWidget {
  const FlutterBloc({super.key});

  @override
  Widget build(BuildContext context) {
    // final count = BlocProvider.of<BlocVm>(listen: true, context);
    final count = context.read<BlocVm>();
    return Scaffold(
      body: Expanded(
        child: BlocBuilder<BlocVm, int>(
          bloc: count,
          builder: (context, counter) {
            return Center(
              child: Text(
                'counter: ${count.state}',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
        ),
      ),
      floatingActionButton: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Text('+'),
        onPressed: () {
          count.increment();
        },
      ),
      FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Text('-'),
        onPressed: () {
          count.decrement();
        },
      ),
        ],
      )
    );
  }
}
