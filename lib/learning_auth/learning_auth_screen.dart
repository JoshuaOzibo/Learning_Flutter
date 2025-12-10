import 'package:flutter/material.dart';
import 'package:flutter_application_1/learning_auth/viewmodel_with_cubit/viewmodel_auth.dart';
import 'package:flutter_application_1/learning_auth/viewmodel_with_cubit/viewmodel_state.dart';
import 'package:flutter_application_1/learning_auth/widgets/email_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearningAuthScreen extends StatefulWidget {
  const LearningAuthScreen({super.key});

  @override
  State<LearningAuthScreen> createState() => _LearningAuthScreenState();
}

class _LearningAuthScreenState extends State<LearningAuthScreen> {
  final TextEditingController _emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<ViewmodelAuth, ViewmodelState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailField(
                  handleSubscribeButton: () => context.read<ViewmodelAuth>().validateEmail(_emailController.text),
                  emailController: _emailController,
                  onChangedVal: (value) => context.read<ViewmodelAuth>().onChangeEmail(value),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
