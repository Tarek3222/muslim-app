import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/core/helper/cache_helper.dart';
import 'package:muslim/features/settings/presentation/view_model/change_theme_cubit/change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitialState());
  bool isDarkMode = false;

  void changeTheme() {
    isDarkMode = !isDarkMode;
    CacheHelper.saveData(key: 'isDarkMode', value: isDarkMode);
    emit(ChangeThemeSuccessState());
  }

  init() {
    isDarkMode = CacheHelper.getData(key: 'isDarkMode') ?? false;
    emit(ChangeThemeSuccessState());
  }
}
