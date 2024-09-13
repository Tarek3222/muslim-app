

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'change_font_state.dart';

class ChangeFontCubit extends Cubit<ChangeFontState> {
  ChangeFontCubit() : super(ChangeFontInitial());

  double fontSize = 18;

  late SharedPreferences storage;
  void changeFontSize({required double newFontSize}) {
    fontSize = newFontSize;
    storage.setDouble('fontSize', fontSize);
    emit(ChangeFontSuccess());
  }

  init() async{
    storage=await SharedPreferences.getInstance();
    fontSize = storage.getDouble('fontSize') ?? 18;
    emit( ChangeFontSuccess());
  }
}
