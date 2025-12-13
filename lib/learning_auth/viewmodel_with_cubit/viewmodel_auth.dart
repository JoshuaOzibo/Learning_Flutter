import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/learning_auth/pages/home_auth_cubit.dart';
import 'package:flutter_application_1/learning_auth/viewmodel_with_cubit/viewmodel_state.dart';
import 'package:flutter_application_1/learning_auth/widgets/validate_code.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewmodelAuth extends Cubit<ViewmodelState> {
  final Auth0 auth0;
  ViewmodelAuth(this.auth0) : super(ViewmodelState(isAuthenticated: false));

  onChangeEmail(String changedEmail) {
    print(changedEmail);
    if (changedEmail.contains('@')) {
      print('activationButton: true');
      emit(state.copyWith(activateButton: true));
    }
  }

  void loginWithEmail(String email, BuildContext context) async {
    if (!state.activateButton) return;

    emit(state.copyWith(isLoading: true, errorMessage: null, email: email));

    try {
      print('processing api');

      await auth0.api.startPasswordlessWithEmail(
        email: email,
        passwordlessType: PasswordlessType.code,
      );

      print('email sent');

      emit(state.copyWith(isLoading: false));

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ValidateCode()),
      );
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      print(e);
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

  Future<void> validateCode(BuildContext context) async {
    try {
      emit(state.copyWith(isLoading: true));
      print(
        'Attempting login with email: ${state.email} and code: ${state.changedValidationCode}',
      );

      // 1️⃣ Login with OTP / email code
      final credentials = await auth0.api.loginWithEmailCode(
        email: state.email!,
        verificationCode: state.changedValidationCode!,
      );

      // 2️⃣ Validate claims (security best practice)
      // credentials.validateClaims();

      print('Login success. Access Token: ${credentials.accessToken}');

      // 3️⃣ Navigate to home
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const HomeAuthCubit()),
      );

      // 4️⃣ Update state
      emit(
        state.copyWith(
          isLoading: false,
          changedValidationCode: null,
          activateButton: false,
          isAuthenticated: true,
        ),
      );
    } catch (e) {
      print('Error during login: $e');
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }
}
