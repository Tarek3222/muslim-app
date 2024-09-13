import 'package:dartz/dartz.dart';
import 'package:muslim/core/errors/failure.dart';
import 'package:muslim/features/quran/data/models/prayer_time_model.dart';

abstract class QuranRepo{
  Future<Either<Failure,PrayerTimeModel>> getPrayerTimes();
}