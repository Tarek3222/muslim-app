import 'package:flutter/material.dart';
import 'package:muslim/features/quran/data/models/surah_data_model.dart';
import 'package:muslim/features/quran/presentation/views/widgets/surah_view_body.dart';

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
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: SurahViewBody(
          surah: widget.surah,
        ),
      ),
    );
  }
}
