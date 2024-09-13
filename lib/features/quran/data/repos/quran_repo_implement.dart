import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:muslim/core/errors/failure.dart';
import 'package:muslim/core/utils/api_service.dart';
import 'package:muslim/features/quran/data/models/prayer_time_model.dart';
import 'package:muslim/features/quran/data/repos/quran_repo.dart';

class QuranRepoImplement extends QuranRepo{
  final ApiService apiService;

  QuranRepoImplement(this.apiService);
  
  @override
  Future<Either<Failure,PrayerTimeModel>> getPrayerTimes() async{
     try {
      var data = await apiService.get(
        endPoint:
            "v1/timingsByCity?city=cairo&country=egypt&method=8",
            baseUrl: "https://api.aladhan.com");
      PrayerTimeModel prayerTimeModel = PrayerTimeModel.fromJson(data);
      return right(prayerTimeModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

}