import 'package:flutter/material.dart';
import 'package:muslim/features/azkar/data/models/zekr_model.dart';

class BuilderDescZekr extends StatelessWidget {
  const BuilderDescZekr({super.key, required this.zekr});
  final ZekrModel zekr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        zekr.description?.isEmpty == true ? "لا يوجد وصف" : zekr.description!,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.right,
      ),
    );
  }
}
