import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/core/helper/cache_helper.dart';
import 'package:muslim/core/helper/local_notifications_service.dart';

part 'change_font_state.dart';

class ChangeNotificationCubit extends Cubit<ChangeNotfiactionState> {
  ChangeNotificationCubit() : super(ChangeNotificationInitial());

  bool isEnabled = false;

  void changeNotification() {
    isEnabled = !isEnabled;
    if (isEnabled) {
      LocalNotificationsService.cancelAllNotification();
    }
    CacheHelper.saveData(key: 'isEnabled', value: isEnabled);
    emit(ChangeNotificationSuccess());
  }

  init() {
    isEnabled = CacheHelper.getData(key: 'isEnabled') ?? false;
    emit(ChangeNotificationSuccess());
  }
}
