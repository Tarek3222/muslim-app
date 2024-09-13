import 'package:flutter/material.dart';
import 'package:muslim/core/constants/language_constants.dart';

class TabSurah extends StatelessWidget {
  const TabSurah({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 16),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
          ),
          child: Text(
            translate(context).surah,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
