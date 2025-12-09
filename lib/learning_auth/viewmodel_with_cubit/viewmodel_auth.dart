import 'package:flutter_application_1/learning_auth/viewmodel_with_cubit/viewmodel_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewmodelAuth extends Cubit<ViewmodelState> {
  ViewmodelAuth() : super(ViewmodelState(isAuthenticated: false));
}
