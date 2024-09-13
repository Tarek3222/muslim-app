
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'change_count_and_save_state.dart';

class ChangeCountAndSaveCubit extends Cubit<ChangeCountAndSaveState> {
  ChangeCountAndSaveCubit() : super(ChangeCountAndSaveInitial());
  int count = 0;
  late SharedPreferences storage;
  void increaseCount() {
    count = count + 1;
    storage.setInt('count', count);
    emit(ChangeCountAndSaveSuccess());
  }

  init() async{
    storage=await SharedPreferences.getInstance();
    count = storage.getInt('count') ?? 0;
    emit( ChangeCountAndSaveSuccess());
  }
  void reset(){
    count=0;
    storage.setInt('count', count);
    emit(ChangeCountAndSaveSuccess());
  }
}
