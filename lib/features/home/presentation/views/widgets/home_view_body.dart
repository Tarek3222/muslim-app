import 'package:flutter/material.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/features/azkar/presentation/views/azkar_body_view.dart';
import 'package:muslim/features/hadeth/presentation/views/hadeth_body_view.dart';
import 'package:muslim/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:muslim/features/quran/presentation/views/quran_body_view.dart';
import 'package:muslim/features/radio/presentation/views/radio_tab_body.dart';
import 'package:muslim/features/settings/presentation/views/settings_body_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final List<Widget> widgetOfHome = const [
    QuranBodyView(),
    HadethBodyView(),
    AzkarBodyView(),
    RadioTabBody(),
    SettingsBodyView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(translate(context).title),
        ),
        body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: widgetOfHome[currentIndex]),
        bottomNavigationBar: CustomBottomNavBar(
          onTap: (index) {
            setState(
              () {
                currentIndex = index;
              },
            );
          },
          currentIndex: currentIndex,
        ));
  }
}
