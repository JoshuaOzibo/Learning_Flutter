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
    print(validCode);
    if (validCode.length < 6) {
      emit(state.copyWith(activateButton: false));
    }

    emit(
      state.copyWith(
        changedValidationCode: validCode,
        activateButton: true,
        errorMessage: null,
        isLoading: false,
      ),
    );
  }

  void validateCode() {
    try {
      emit(state.copyWith(isLoading: true));
      Future.delayed(const Duration(seconds: 2), () {
        print(state.changedValidationCode);
      });
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
    emit(state.copyWith(changedValidationCode: null, isLoading: false));
  }
}
