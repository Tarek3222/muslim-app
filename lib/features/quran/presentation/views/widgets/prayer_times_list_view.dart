import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/core/functions/get_list_prayer_times.dart';
import 'package:muslim/core/widgets/custom_error_widget.dart';
import 'package:muslim/features/quran/data/models/prayer_one_time_model.dart';
import 'package:muslim/features/quran/data/models/prayer_time_model.dart';
import 'package:muslim/features/quran/presentation/view_model/prayer_time_cubot/prayer_times_cubit.dart';
import 'package:muslim/features/quran/presentation/views/widgets/custom_one_prayer_time.dart';
import 'package:muslim/features/quran/presentation/views/widgets/prayer_items_list_loading.dart';

class PrayerTimesListView extends StatelessWidget {
  const PrayerTimesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
      builder: (context, state) {
        if (state is PrayerTimesSuccess) {
          PrayerTimeModel prayerTime = state.prayerTimeModel;
          List<PrayerOneTimeModel> prayerTimes =getListPrayerTimes(context, prayerTime);
          return ListView.separated(
            itemBuilder: (context, index) {
              return CustomOnePrayerTime(
                prayerTime: prayerTimes[index],
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Theme.of(context).colorScheme.onSecondary,
                thickness: 0.4,
              );
            },
            itemCount: prayerTimes.length,
          );
        } else if (state is PrayerTimesFailure) {
          return CustomErrorWidget(
            error: state.errorMessage,
            onPressed: () {
              BlocProvider.of<PrayerTimesCubit>(context).getPrayerTimesToday();
            },
          );
        } else {
          return const PrayerTimesListLoading();
        }
      },
    );
  }

}
