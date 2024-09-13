import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/core/utils/app_router.dart';
import 'package:muslim/core/utils/styles.dart';
import 'package:muslim/features/quran/presentation/views/widgets/date_and_time_widget.dart';
import 'package:muslim/features/settings/presentation/view_model/change_theme_cubit/change_theme_cubit.dart';
import 'package:muslim/features/settings/presentation/view_model/change_theme_cubit/change_theme_state.dart';

class PrayerTimesWidget extends StatelessWidget {
  const PrayerTimesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kPreyerTimeView);
          },
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.5,
                child: AspectRatio(
                  aspectRatio: 3.3 / 2,
                  child: Container(
                    padding:
                        const EdgeInsetsDirectional.only(end: 5, bottom: 5),
                    alignment: AlignmentDirectional.bottomEnd,
                    margin: const EdgeInsets.symmetric(
                        vertical: 34, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: BlocProvider.of<ChangeThemeCubit>(context)
                                .isDarkMode
                            ? const AssetImage('assets/images/prayer_times.jpg')
                            : const AssetImage(
                                'assets/images/prayer_times_light.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          translate(context).prayer_time,
                          style: AppStyles.textStyle19,
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
             const Directionality(
                textDirection: TextDirection.ltr,
                child:  DateAndTimeWidget(),
              ),
            ],
          ),
        );
      },
    );
  }
}
