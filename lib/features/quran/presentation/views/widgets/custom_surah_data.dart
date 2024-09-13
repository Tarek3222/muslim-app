import 'package:flutter/material.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/features/quran/data/models/surah_data_model.dart';

class CustomSurahData extends StatelessWidget {
  const CustomSurahData({super.key, required this.surah});

  final SurahDataModel surah;
  @override
  Widget build(BuildContext context) {
    Locale appLocale = Localizations.localeOf(context);
    return ListTile(
      leading: Container(
        alignment: Alignment.center,
        width: 50,
        height: 45,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
        ),
        child: Text(
          surah.number.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w300),
        ),
      ),
      title: Text(
        appLocale.languageCode == 'en' ? surah.englishName : surah.arabicName,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        appLocale.languageCode == 'en'
            ? surah.revelationTypeEnglish
            : surah.revelationTypeArabic,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: Text(
        '${translate(context).number_of_ayahs}: ${surah.numberOfAyats}',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
