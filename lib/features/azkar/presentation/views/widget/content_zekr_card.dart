import 'package:flutter/material.dart';
import 'package:muslim/features/azkar/data/models/zekr_model.dart';
import 'package:muslim/features/azkar/presentation/views/widget/builder_desc_zekr.dart';

class ContentZekrCard extends StatelessWidget {
  const ContentZekrCard({super.key, required this.zekr});
  final ZekrModel zekr;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          elevation: 0,
          context: context,
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          builder: (context) {
            return  BuilderDescZekr(zekr:zekr);
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * 0.8,
         margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          zekr.content!,
          style: Theme.of(context).textTheme.bodyMedium,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
