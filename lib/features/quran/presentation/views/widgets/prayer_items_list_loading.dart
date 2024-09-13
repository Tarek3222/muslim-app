import 'package:flutter/material.dart';
import 'package:muslim/features/quran/presentation/views/widgets/custom_one_prayer_item_laod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PrayerTimesListLoading extends StatelessWidget {
  const PrayerTimesListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return const CustomOnePrayerTimeLoad();
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 7,
      ),
    );
  }
}
