import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import '../viewmodel_with_cubit/viewmodel_auth.dart';
import '../viewmodel_with_cubit/viewmodel_state.dart';

class ValidateCode extends StatelessWidget {
  const ValidateCode({super.key});

  @override
  Widget build(BuildContext context) {
    final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

    return BlocConsumer<ViewmodelAuth, ViewmodelState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
        if (state.isAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Authentication Successful!')),
          );
        }
      },
      builder: (context, state) {
        final vm = context.read<ViewmodelAuth>();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                spacing: 20,
                children: [
                  OtpPinField(
                    key: _otpPinFieldController,
                    autoFillEnable: false,
                    textInputAction: TextInputAction.done,
                    onSubmit: (text) {},
                    onChange: (text) {
                      vm.onChangeValidationCode(text);
                    },
                    onCodeChanged: (code) {
                      print('onCodeChanged  is $code');
                    },
                    otpPinFieldStyle: OtpPinFieldStyle(
                      showHintText: true,
                      defaultFieldBorderColor: Colors.grey.shade400,
                      activeFieldBorderColor: Colors.grey.shade700,
                    ),
                    maxLength: 6,
                    showCursor: true,
                    cursorColor: Colors.indigo,
                    showCustomKeyboard: false,
                    cursorWidth: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration,
                  ),

                  MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    color: state.activateButton ? Colors.brown : Colors.grey,
                    elevation: 0,
                    onPressed: state.activateButton && !state.isLoading
                        ? () {
                            vm.validateCode(context);
                          }
                        : null,
                    child: Center(
                      child: state.isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            )
                          : const Text(
                              'Validate Code',
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
