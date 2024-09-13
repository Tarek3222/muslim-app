import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/features/quran/data/models/surah_data_model.dart';
import 'package:muslim/features/quran/presentation/views/widgets/header_surah.dart';
import 'package:muslim/features/quran/presentation/views/widgets/surah_ayat_widget.dart';
import 'package:muslim/features/settings/presentation/view_model/change_font_cubit/change_font_cubit.dart';

class SurahViewBody extends StatelessWidget {
  const SurahViewBody({super.key, required this.surah});
  final SurahDataModel surah;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        HeaderSurah(
          surahData: surah,
        ),
        !(surah.number == 1)
            ? !(surah.number == 9)
                ? BlocBuilder<ChangeFontCubit, ChangeFontState>(
                    builder: (context, state) {
                      return Text(
                        "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: BlocProvider.of<ChangeFontCubit>(context).fontSize,
                        ),
                      );
                    },
                  )
                : const SizedBox()
            : const SizedBox(),
        const SizedBox(height: 2),
        SurahAyatWidget(surah: surah),
      ],
    );
  }
}
