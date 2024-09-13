import 'package:flutter/material.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/features/settings/data/models/language_model.dart';
import 'package:muslim/main.dart';

class CustmDropDownMenu extends StatefulWidget {
  const CustmDropDownMenu({super.key});

  @override
  State<CustmDropDownMenu> createState() => _CustmDropDownMenuState();
}

class _CustmDropDownMenuState extends State<CustmDropDownMenu> {
  List<LanguageModel> language1 = LanguageModel.languages;
  @override
  Widget build(BuildContext context) {
     Locale appLocale=Localizations.localeOf(context);
    return DropdownButton<LanguageModel>(
      isExpanded: true,
      underline: const SizedBox(),
      style: Theme.of(context).textTheme.bodySmall,
      value: appLocale.languageCode =='en'?language1[0]:language1[1],
      dropdownColor: Theme.of(context).colorScheme.primary,
      items: LanguageModel.languages.map((LanguageModel value) {
        return DropdownMenuItem<LanguageModel>(
          value: value,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 8),
                child: Text(value.flag),
              ),
              Text(value.name),
            ],
          ),
        );
      }).toList(),
      onChanged: (language) async{
        if(language !=null){
          Locale locale =await setLocale(language.code);
          // ignore: use_build_context_synchronously
          MuslimApp.setLocale(context, locale,);
           setState(() {
          appLocale =locale;
        });
        }
      },
    );
  }
}
