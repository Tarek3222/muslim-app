part of 'prayer_times_cubit.dart';

sealed class PrayerTimesState {}

final class PrayerTimesInitial extends PrayerTimesState {}

final class PrayerTimesLoading extends PrayerTimesState {}

final class PrayerTimesSuccess extends PrayerTimesState {
  final PrayerTimeModel prayerTimeModel;
  PrayerTimesSuccess({required this.prayerTimeModel});
}

final class PrayerTimesFailure extends PrayerTimesState {
  final String errorMessage;
  PrayerTimesFailure({required this.errorMessage});
}
