import 'package:bloc/bloc.dart';

class CheckBoxListTileCubit extends Cubit<bool> {
  CheckBoxListTileCubit({bool isChecked = false}) : super(isChecked);

  void toggle() => emit(!state);
}
