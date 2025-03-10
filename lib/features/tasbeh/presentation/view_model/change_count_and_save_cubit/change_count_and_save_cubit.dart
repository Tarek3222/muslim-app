import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/core/helper/cache_helper.dart';

part 'change_count_and_save_state.dart';

class ChangeCountAndSaveCubit extends Cubit<ChangeCountAndSaveState> {
  ChangeCountAndSaveCubit() : super(ChangeCountAndSaveInitial());
  int count = 0;
  void increaseCount() {
    count = count + 1;
    CacheHelper.saveData(key: 'count', value: count);
    emit(ChangeCountAndSaveSuccess());
  }

  init() {
    count = CacheHelper.getData(key: 'count') ?? 0;
    emit(ChangeCountAndSaveSuccess());
  }

  void reset() {
    count = 0;
    CacheHelper.saveData(key: 'count', value: count);
    emit(ChangeCountAndSaveSuccess());
  }
}
