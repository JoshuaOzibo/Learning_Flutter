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

    return BlocBuilder<ViewmodelAuth, ViewmodelState>(
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

                    ///in case you want to enable autoFill
                    autoFillEnable: false,

                    ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                    textInputAction: TextInputAction.done,

                    ///in case you want to change the action of keyboard
                    /// to clear the Otp pin Controller
                    onSubmit: (text) {},
                    onChange: (text) {
                      vm.onChangeValidationCode(text);
                    },
                    onCodeChanged: (code) {
                      print('onCodeChanged  is $code');
                    },

                    /// to decorate your Otp_Pin_Field
                    otpPinFieldStyle: OtpPinFieldStyle(
                      /// bool to show hints in pin field or not
                      showHintText: true,

                      /// to set the color of hints in pin field or not
                      // hintTextColor: Colors.red,

                      /// To set the text  of hints in pin field
                      // hintText: '1',

                      /// border color for inactive/unfocused Otp_Pin_Field
                      defaultFieldBorderColor: Colors.grey.shade400,

                      /// border color for active/focused Otp_Pin_Field
                      activeFieldBorderColor: Colors.grey.shade700,

                      /// Background Color for inactive/unfocused Otp_Pin_Field
                      // defaultFieldBackgroundColor: Colors.yellow,

                      /// Background Color for active/focused Otp_Pin_Field
                      // activeFieldBackgroundColor: Colors.cyanAccent,

                      /// Background Color for filled field pin box
                      // filledFieldBackgroundColor: Colors.green,

                      /// border Color for filled field pin box
                      // filledFieldBorderColor: Colors.green,
                      //
                      /// gradient border Color for field pin box
                      // activeFieldBorderGradient: LinearGradient(
                      //   colors: [Colors.black, Colors.redAccent],
                      // ),
                      // filledFieldBorderGradient: LinearGradient(
                      //   colors: [Colors.green, Colors.tealAccent],
                      // ),
                      // defaultFieldBorderGradient: LinearGradient(
                      //   colors: [Colors.orange, Colors.brown],
                      // ),
                    ),
                    maxLength: 6,

                    /// no of pin field
                    showCursor: true,

                    /// bool to show cursor in pin field or not
                    cursorColor: Colors.indigo,

                    ///bool which manage to show custom keyboard
                    showCustomKeyboard: false,

                    /// Widget which help you to show your own custom keyboard in place if default custom keyboard
                    // customKeyboard: Container(),
                    ///bool which manage to show default OS keyboard
                    // showDefaultKeyboard: true,
                    /// to select cursor width
                    cursorWidth: 3,

                    /// place otp pin field according to yourself
                    mainAxisAlignment: MainAxisAlignment.center,

                    /// predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                    ///use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration,
                  ),

                  MaterialButton(
                    height: 40,
                    minWidth: double.infinity,
                    color: Colors.brown,
                    elevation: 0,
                    onPressed: () {
                      vm.validateCode();
                    },
                    child: Center(
                      child: state.isLoading!
                          ? CircularProgressIndicator()
                          : Text('Validate Code'),
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
