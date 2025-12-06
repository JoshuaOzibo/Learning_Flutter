import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit_auth/cubit_auth_state.dart';
import 'package:flutter_application_1/cubit_auth/cubit_auth_vm.dart';
import 'package:flutter_application_1/cubit_auth/cubit_button.dart';
import 'package:flutter_application_1/cubit_auth/cubit_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitAuthPage extends StatefulWidget {
  const CubitAuthPage({super.key});

  @override
  State<CubitAuthPage> createState() => _CubitAuthPageState();
}

class _CubitAuthPageState extends State<CubitAuthPage> {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CubitAuthVm, CubitAuthState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              spacing: 20,
              children: [
                CubitForm(
                  emailController: emailController,
                  passwordController: passwordController,
                ),

                CubitButton(
                  disabledColor: Colors.grey.shade300,
                  submitHandler: () {
                    context.read<CubitAuthVm>().handleSubmit(
                    context: context,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  emailController.clear();
                  passwordController.clear();
                  },
                  widget: state.isLoading == true
                      ? CircularProgressIndicator()
                      : Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
