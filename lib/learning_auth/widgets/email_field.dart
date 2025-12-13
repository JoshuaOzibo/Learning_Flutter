import 'package:flutter/material.dart';
import 'package:flutter_application_1/learning_auth/viewmodel_with_cubit/viewmodel_auth.dart';
import 'package:flutter_application_1/learning_auth/viewmodel_with_cubit/viewmodel_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.handleSubscribeButton,
    required this.emailController,
    required this.onChangedVal,
  });

  final VoidCallback handleSubscribeButton;
  final TextEditingController emailController;
  final Function onChangedVal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewmodelAuth, ViewmodelState>(
      builder: (context, state) {
        return Column(
          spacing: 20,
          children: [
            TextField(
              autocorrect: true,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              onChanged: (value) => onChangedVal(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueGrey,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: EdgeInsets.all(20),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.green),
                ),
                hint: Text('Enter email'),
                label: Text('Hello'),
              ),
            ),

            BlocSelector<ViewmodelAuth, ViewmodelState, bool>(
              selector: (state) => state.activateButton,
              builder: (context, activateButton) {
                final vm = context.read<ViewmodelAuth>();
                return MaterialButton(
                  height: 50,
                  minWidth: double.infinity,
                  color: activateButton ? Colors.brown : Colors.grey,
                  elevation: 0,
                  onPressed: () {
                    vm.validateCode();
                  },
                  child: Center(
                    child: state.isLoading ?? false
                        ? CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          )
                        : Text('Login'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
