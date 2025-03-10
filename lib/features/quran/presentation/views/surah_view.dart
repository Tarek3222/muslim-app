import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/features/quran/data/models/surah_data_model.dart';
import 'package:muslim/features/settings/presentation/view_model/change_theme_cubit/change_theme_cubit.dart';
import 'package:quran_library/quran_library.dart';

class SurahView extends StatefulWidget {
  const SurahView({super.key, required this.surah});
  final SurahDataModel surah;

  @override
  State<SurahView> createState() => _SurahViewState();
}

class _SurahViewState extends State<SurahView> {
  @override
  void initState() {
    super.initState();
    QuranLibrary().jumpToSurah(widget.surah.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: QuranLibraryScreen(
        isDark: context.read<ChangeThemeCubit>().isDarkMode,
        languageCode: translate(context).localeName,
      ),
    );
  }
}
