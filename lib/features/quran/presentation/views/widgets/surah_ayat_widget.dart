import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/features/quran/data/models/surah_data_model.dart';
import 'package:muslim/features/settings/presentation/view_model/change_font_cubit/change_font_cubit.dart';

class SurahAyatWidget extends StatefulWidget {
  const SurahAyatWidget({super.key, required this.surah});
  final SurahDataModel surah;

  @override
  State<SurahAyatWidget> createState() => _SurahAyatWidgetState();
}

class _SurahAyatWidgetState extends State<SurahAyatWidget> {
  String content = '';
  String sura = '';
  @override
  Widget build(BuildContext context) {
    if (content.isEmpty) {
      readFile(widget.surah.number);
    }
    return BlocBuilder<ChangeFontCubit, ChangeFontState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 5, left: 2),
          child: Text(
            sura,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: BlocProvider.of<ChangeFontCubit>(context).fontSize,
            ),
          ),
        );
      },
    );
  }

  readFile(index) async {
    String text = await rootBundle.loadString('assets/files/quran/$index.txt');
    text = text.trim();
    content = text;
    List<String> suraVerses = text.split('\n');

    for (int i = 0; i < suraVerses.length; i++) {
      sura += '${suraVerses[i].trim()}{${i + 1}}';
    }
    setState(() {});
  }
}
