import 'package:flutter/material.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/features/quran/data/models/surah_data_model.dart';

class HeaderSurah extends StatelessWidget {
  const HeaderSurah({
    super.key, required this.surahData,
  });
  final SurahDataModel surahData;
  @override
  Widget build(BuildContext context) {
    Color secondaryColor= Theme.of(context).colorScheme.onSecondary;
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/header_surah.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              height: 75,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "اياتها\n${surahData.numberOfAyats}",
                  style: TextStyle(
                    fontSize: 8,
                    fontFamily: kMainFontFamily,
                    color: secondaryColor,
                  ),
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: surahData.arabicName,
                      style: TextStyle(
                          fontFamily: kMainFontFamily,
                          fontSize: 22,
                          color: secondaryColor),
                    ),
                  ),
                ),
                Text(
                  "ترتيبها\n${surahData.number}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 7.5,
                    fontFamily: kMainFontFamily,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
