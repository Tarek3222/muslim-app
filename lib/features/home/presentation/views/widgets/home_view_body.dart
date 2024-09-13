import 'package:flutter/material.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/features/azkar/presentation/views/azkar_body_view.dart';
import 'package:muslim/features/hadeth/presentation/views/hadeth_body_view.dart';
import 'package:muslim/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:muslim/features/quran/presentation/views/quran_body_view.dart';
import 'package:muslim/features/settings/presentation/views/settings_body_view.dart';
import 'package:muslim/features/tasbeh/presentation/views/tasbeh__body_view.dart';

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
    TasbehBodyView(),
    SettingsBodyView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(translate(context).title),
        ),
        body: widgetOfHome[currentIndex],
        bottomNavigationBar: CustomBottomNavBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
        )
      );
  }
}