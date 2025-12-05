import 'package:bloc/bloc.dart';

class CubitVm extends Cubit<List<String>> {
  CubitVm(): super([]);

  void addToList(String value){
    emit([value, ...state]);
    print('func value $value');
    print('state value $state');
  }

    @override
  void onChange(Change<List<String>> change) {
    super.onChange(change);

    print('vm change: $change');
  }
}