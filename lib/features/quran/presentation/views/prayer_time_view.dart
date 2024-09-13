import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/features/quran/presentation/view_model/prayer_time_cubot/prayer_times_cubit.dart';
import 'package:muslim/features/quran/presentation/views/widgets/prayer_times_view_body.dart';
import 'package:muslim/features/settings/presentation/view_model/change_theme_cubit/change_theme_cubit.dart';
import 'package:muslim/features/settings/presentation/view_model/change_theme_cubit/change_theme_state.dart';

class PrayerTimeView extends StatefulWidget {
  const PrayerTimeView({super.key});

  @override
  State<PrayerTimeView> createState() => _PrayerTimeViewState();
}

class _PrayerTimeViewState extends State<PrayerTimeView> {
  @override
  void initState() {
    BlocProvider.of<PrayerTimesCubit>(context).getPrayerTimesToday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: BlocProvider.of<ChangeThemeCubit>(context).isDarkMode
                  ? const AssetImage('assets/images/background_dark.png')
                  : const AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Scaffold(
            body: PrayerTimesViewBody(),
          ),
        );
      },
    );
  }
}
