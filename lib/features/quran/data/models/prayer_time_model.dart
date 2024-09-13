
class PrayerTimeModel{
  final String? fajrTime;
  final String? sunriseTime;
  final String? dhuhrTime;
  final String? asrTime;
  final String? sunsetTime;
  final String? maghribTime;
  final String? ishaTime;
  final String? dateHijri;
  final String? dayNameAr;
  final String? dayNameEn;
  final String? monthNameHijriAr;
  final String? monthNameHijriEn;

 const PrayerTimeModel({this.fajrTime, this.sunriseTime, this.dhuhrTime, this.asrTime, this.sunsetTime, this.maghribTime, this.ishaTime, this.dateHijri, this.dayNameAr, this.dayNameEn, this.monthNameHijriAr, this.monthNameHijriEn});

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return  PrayerTimeModel(
      fajrTime: json['data']['timings']['Fajr'],
      sunriseTime: json['data']['timings']['Sunrise'],
      dhuhrTime: json['data']['timings']['Dhuhr'],
      asrTime: json['data']['timings']['Asr'],
      sunsetTime: json['data']['timings']['Sunset'],
      maghribTime: json['data']['timings']['Maghrib'],
      ishaTime: json['data']['timings']['Isha'],
      dateHijri: json['data']['date']['hijri']['date'],
      dayNameAr: json['data']['date']['hijri']['weekday']['ar'],
      dayNameEn: json['data']['date']['gregorian']['weekday']['en'],
      monthNameHijriAr: json['data']['date']['hijri']['month']['ar'],
      monthNameHijriEn: json['data']['date']['hijri']['month']['en'],
    );
  }

  Map<String, dynamic> toJson() => {
    'fajrTime': fajrTime,
    'sunriseTime': sunriseTime,
    'dhuhrTime': dhuhrTime,
    'asrTime': asrTime,
    'sunsetTime': sunsetTime,
    'maghribTime': maghribTime,
    'ishaTime': ishaTime,
    'dateHijri': dateHijri,
    'dayNameAr': dayNameAr,
    'dayNameEn': dayNameEn,
    'monthNameHijriAr': monthNameHijriAr,
    'monthNameHijriEn': monthNameHijriEn,
  };
}