import 'package:flutter/material.dart';
import 'package:muslim/features/quran/presentation/views/widgets/prayer_times_list_view.dart';

class CustomPrayerTimesCard extends StatelessWidget {
  const CustomPrayerTimesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
      ),
      child:const PrayerTimesListView(),
    );
  }
}
