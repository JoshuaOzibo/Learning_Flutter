import 'package:flutter/material.dart';
import 'package:flutter_application_1/full_auth_practice/presentation/viewmodel/state/input_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormInputAuthVm extends Cubit<InputState> {
  FormInputAuthVm() : super(InputState(isAuthenticated: false));
}
