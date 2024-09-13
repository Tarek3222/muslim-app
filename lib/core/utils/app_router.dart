import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/core/utils/api_service.dart';
import 'package:muslim/features/azkar/presentation/views/zekr_category_view.dart';
import 'package:muslim/features/hadeth/data/models/hadeth_model.dart';
import 'package:muslim/features/hadeth/presentation/views/hadeth_details_view.dart';
import 'package:muslim/features/home/presentation/views/home_view.dart';
import 'package:muslim/features/quran/data/models/surah_data_model.dart';
import 'package:muslim/features/quran/data/repos/quran_repo_implement.dart';
import 'package:muslim/features/quran/presentation/view_model/prayer_time_cubot/prayer_times_cubit.dart';
import 'package:muslim/features/quran/presentation/views/prayer_time_view.dart';
import 'package:muslim/features/quran/presentation/views/surah_view.dart';

abstract class AppRouter {
  static const kPreyerTimeView = '/prayer_time_view';
  static const kSurahView = '/surah_view';
  static const kHadethDetailsView = '/hadeth_details_view';
  static const kZekrCategoryView = '/zekr_category_view';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kSurahView,
        builder: (context, state) => SurahView(
          surah: state.extra as SurahDataModel,
        ),
      ),
      GoRoute(
        path: kZekrCategoryView,
        builder: (context, state) => ZekrCategoryView(
          categoryZekr: state.extra as String,
        ),
      ),
      GoRoute(
        path: kHadethDetailsView,
        builder: (context, state) => HadethDetailsView(
          hadethModel: state.extra as HadethModel,
        ),
      ),
      GoRoute(
        path: kPreyerTimeView,
        builder: (context, state) => BlocProvider(
          create: (context) => PrayerTimesCubit(
            QuranRepoImplement(
              ApiService(
                Dio(),
              ),
            ),
          ),
          child: const PrayerTimeView(),
        ),
      ),
    ],
  );
}
