import 'package:flutter_application_1/learning_auth/viewmodel_with_cubit/viewmodel_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewmodelAuth extends Cubit<ViewmodelState> {
  ViewmodelAuth() : super(ViewmodelState(isAuthenticated: false));

  onChangeEmail(String changedEmail) {
    print(changedEmail);
  }

  validateEmail(String email) async {
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 2), () => print('Logged in'));
    print(email);
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
      await Future.delayed(const Duration(seconds: 2), () {
        print(state.changedValidationCode);
      });
      emit(
        state.copyWith(
          isLoading: false,
          changedValidationCode: null,
          activateButton: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }
}
