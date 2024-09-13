import 'package:flutter/material.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/features/settings/presentation/views/widgets/custom_card_languages.dart';
import 'package:muslim/features/settings/presentation/views/widgets/custom_slider.dart';
import 'package:muslim/features/settings/presentation/views/widgets/custom_switch.dart';

class SettingsBodyView extends StatelessWidget {
  const SettingsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
           padding: const EdgeInsetsDirectional.only(start: 4),
           child: Text(translate(context).language,style: Theme.of(context).textTheme.bodyLarge,),
         ),
        const CustomCardLanguages(),
        const SizedBox(height: 20,),
         Row(
           children: [
             Padding(
               padding: const EdgeInsetsDirectional.only(start: 4),
               child: Text(translate(context).dark_mode,style: Theme.of(context).textTheme.bodyLarge,),
             ),
            const Spacer(),
            const CustomSwitch(),
           ],
         ),
        const SizedBox(height: 20,),
          Padding(
           padding: const EdgeInsetsDirectional.only(start: 4),
           child: Text('Size of font',style: Theme.of(context).textTheme.bodyLarge,),
         ),
        const CustomSlider(),
      ],
    );
  }
}