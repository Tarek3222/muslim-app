import 'package:flutter/material.dart';
import 'package:muslim/features/quran/data/models/prayer_one_time_model.dart';

class CustomOnePrayerTime extends StatelessWidget {
  const CustomOnePrayerTime({super.key, required this.prayerTime});
  final PrayerOneTimeModel prayerTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          prayerTime.namePrayer!,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Spacer(),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            "${prayerTime.time} ${prayerTime.prayerAmOrPm}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
