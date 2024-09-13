import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/features/quran/presentation/views/widgets/custom_prayer_times_card.dart';

class PrayerTimesViewBody extends StatelessWidget {
  const PrayerTimesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            '${translate(context).egypt} (${translate(context).cairo})',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            Jiffy.now().EEEE,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
         const CustomPrayerTimesCard(),
        ],
      ),
    );
  }
}


