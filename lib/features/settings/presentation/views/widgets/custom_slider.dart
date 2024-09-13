import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/features/settings/presentation/view_model/change_font_cubit/change_font_cubit.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Slider(
          value: BlocProvider.of<ChangeFontCubit>(context).fontSize,
          min: 10,
          max: 35,
          onChanged: (value) {
            setState(() {
             BlocProvider.of<ChangeFontCubit>(context).changeFontSize(newFontSize: value);
            });
          },
          activeColor: Theme.of(context).colorScheme.onSecondary,
          inactiveColor: Theme.of(context).colorScheme.onPrimary,
        ),
        Text(
          "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: BlocProvider.of<ChangeFontCubit>(context).fontSize, 
          ),
        ),
      ],
    );
  }
}