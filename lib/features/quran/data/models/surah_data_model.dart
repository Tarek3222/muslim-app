import 'package:muslim/core/constants/surah_data_constants.dart';

class SurahDataModel {
 final int number;
 final String arabicName;
 final String englishName;
 final String numberOfAyats;
 final String revelationTypeArabic;
 final String revelationTypeEnglish;

  SurahDataModel({
    required this.number,
    required this.arabicName,
    required this.englishName,
    required this.numberOfAyats,
    required this.revelationTypeArabic,
    required this.revelationTypeEnglish,
  });

  static List<SurahDataModel> getSurahLists(){
    List<SurahDataModel> surahList = [];
    for(int i=0;i<114;i++){
      surahList.add(
        SurahDataModel(
          number: i+1,
          arabicName: kSurahNamesArabic[i],
          englishName: kSurahNamesEnglish[i].toLowerCase(),
          numberOfAyats: kNumberOfAyahs[i],
          revelationTypeArabic: kRevelationTypeArabic[i],
          revelationTypeEnglish: kRevelationTypeEnglish[i],
        )
      );
    }
    return surahList;
  }
}
