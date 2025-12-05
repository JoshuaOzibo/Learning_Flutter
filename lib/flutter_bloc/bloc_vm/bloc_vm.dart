import 'package:bloc/bloc.dart';

class BlocVm extends Cubit<int> {
  BlocVm() : super(0);

  void increment(){
    emit( state + 1);
  }
  void decrement(){
    emit( state - 1);
  }
}