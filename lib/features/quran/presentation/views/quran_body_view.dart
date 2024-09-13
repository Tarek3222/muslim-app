import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muslim/features/quran/presentation/views/widgets/prayer_times_widget.dart';
import 'package:muslim/features/quran/presentation/views/widgets/surah_list_view.dart';
import 'package:muslim/features/quran/presentation/views/widgets/tab_surah.dart';

class QuranBodyView extends StatelessWidget {
  const QuranBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PrayerTimesWidget(),
        TabSurah(),
        Expanded(
          child: SurahListView(),
        ),
      ],
    );
  }
}
