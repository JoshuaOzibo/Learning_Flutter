import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit_auth/cubit_auth_state.dart';
import 'package:flutter_application_1/cubit_auth/cubit_home_page.dart';

class CubitAuthVm extends Cubit<CubitAuthState> {
  CubitAuthVm() : super(CubitAuthState(isAuthenticated: false));

  final String realEmail = 'email@gmail.com';
  final String realPassword = '1234';

  handleSubmit({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      if (email == realEmail && password == realPassword) {
        emit(state.copyWith(isAuthenticated: true, isLoading: false));
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => CubitHomePage()));
      } else {
        String errorMessage = '';
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: errorMessage = 'Invalid email or password',
          ),
        );
        SnackBar(content: Text(errorMessage));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  @override
  void onChange(Change<CubitAuthState> change) {
    print('current state: ${change.currentState}, nextState: ${change.nextState}  ');
    super.onChange(change);
  }
}
