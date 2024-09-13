import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/features/quran/data/models/prayer_one_time_model.dart';
import 'package:muslim/features/quran/data/models/prayer_time_model.dart';

List<PrayerOneTimeModel> getListPrayerTimes(
      context, PrayerTimeModel prayerTime) {
    List<PrayerOneTimeModel> prayerTimes = [
      PrayerOneTimeModel(
          time: prayerTime.fajrTime,
          namePrayer: translate(context).fajr,
          prayerAmOrPm: "Am"),
      PrayerOneTimeModel(
          time: prayerTime.sunriseTime,
          namePrayer: translate(context).sunrise,
          prayerAmOrPm: "Am"),
      PrayerOneTimeModel(
          time: prayerTime.dhuhrTime,
          namePrayer: translate(context).dhuhr,
          prayerAmOrPm: "Pm"),
      PrayerOneTimeModel(
          time: prayerTime.asrTime,
          namePrayer: translate(context).asr,
          prayerAmOrPm: "Pm"),
      PrayerOneTimeModel(
          time: prayerTime.sunsetTime,
          namePrayer: translate(context).sunset,
          prayerAmOrPm: "Pm"),
      PrayerOneTimeModel(
          time: prayerTime.maghribTime,
          namePrayer: translate(context).maghrib,
          prayerAmOrPm: "Pm"),
      PrayerOneTimeModel(
          time: prayerTime.ishaTime,
          namePrayer: translate(context).isha,
          prayerAmOrPm: "Pm"),
    ];
    return prayerTimes;
  }