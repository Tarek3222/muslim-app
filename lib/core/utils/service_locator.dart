import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:muslim/core/utils/api_service.dart';
import 'package:muslim/features/quran/data/repos/quran_repo_implement.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
     ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<QuranRepoImplement>(
   QuranRepoImplement(
      getIt.get<ApiService>(),
    ),
  );
}
