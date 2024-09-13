import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/features/quran/data/models/prayer_time_model.dart';
import 'package:muslim/features/quran/data/repos/quran_repo.dart';

part 'prayer_times_state.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit(this.quranRepo) : super(PrayerTimesInitial());
  final QuranRepo quranRepo;

  Future<void> getPrayerTimesToday() async {
    emit(PrayerTimesLoading());
    final result = await quranRepo.getPrayerTimes();
    result.fold(
      (failure) => emit(
        PrayerTimesFailure(errorMessage: failure.errorMessage),
      ),
      (prayerTime) => emit(
        PrayerTimesSuccess(prayerTimeModel: prayerTime),
      ),
    );
  }
}
