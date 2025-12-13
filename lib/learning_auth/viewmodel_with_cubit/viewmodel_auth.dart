import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/learning_auth/viewmodel_with_cubit/viewmodel_state.dart';
import 'package:flutter_application_1/learning_auth/widgets/validate_code.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewmodelAuth extends Cubit<ViewmodelState> {
  final Auth0 auth0;
  ViewmodelAuth(this.auth0) : super(ViewmodelState(isAuthenticated: false));

  onChangeEmail(String changedEmail) {
    print(changedEmail);
  }

  void loginWithEmail(String email, BuildContext context) async{
    emit(state.copyWith(isLoading: true));
    try {
      await auth0.api.startPasswordlessWithEmail(email: email, passwordlessType: PasswordlessType.code);
      emit(state.copyWith(isAuthenticated: true, isLoading: false));
      if(state.isAuthenticated){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ValidateCode()));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  void onChangeValidationCode(String validCode) {
    emit(
      state.copyWith(
        changedValidationCode: validCode,
        activateButton: validCode.length == 6,
        errorMessage: null,
        isLoading: false,
      ),
    );
  }

  Future<void> validateCode() async {
    try {
      emit(state.copyWith(isLoading: true));
      print(state.email);
      await auth0.api.loginWithEmailCode(email: state.email!, verificationCode: state.changedValidationCode!);
      print('success');
      emit(
        state.copyWith(
          isLoading: false,
          changedValidationCode: null,
          activateButton: false,
          isAuthenticated: true,
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }
}
