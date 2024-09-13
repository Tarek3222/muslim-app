import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/core/utils/app_router.dart';
import 'package:muslim/features/quran/data/models/surah_data_model.dart';
import 'package:muslim/features/quran/presentation/views/widgets/custom_surah_data.dart';
import 'package:muslim/features/quran/presentation/views/widgets/custom_text_field.dart';

class SurahListView extends StatefulWidget {
  const SurahListView({super.key});

  @override
  State<SurahListView> createState() => _SurahListViewState();
}

class _SurahListViewState extends State<SurahListView> {
  List<SurahDataModel> surahs = SurahDataModel.getSurahLists();
    List<SurahDataModel>filterdSurahs = SurahDataModel.getSurahLists();
  @override
  Widget build(BuildContext context) {
    Locale appLocale=Localizations.localeOf(context);  
    return Column(
      children: [
        CustomTextField(
          onChanged: (value) {
            if(value==''){
              setState(() {
                filterdSurahs = surahs;
              });
            }
              if(value!=''){
                filterdSurahs = surahs.where((element) {
                  return appLocale.languageCode=='en'? element.englishName.contains(value.toLowerCase().trim()): element.arabicName.contains(value.trim());
                }).toList();
                setState(() {
                  filterdSurahs = filterdSurahs;
                });
              }
          },
       ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  GoRouter.of(context).push(AppRouter.kSurahView, extra: filterdSurahs[index]);
                },
                child: CustomSurahData(
                  surah: filterdSurahs[index],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 0.2,
                endIndent: 10,
                indent: 10,
              );
            },
            itemCount: filterdSurahs.length,
          ),
        ),
      ],
    );
  }
}
