import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/core/constants/azkar_constants.dart';
import 'package:muslim/core/utils/app_router.dart';
import 'package:muslim/features/azkar/presentation/views/sebaha_view.dart';
import 'package:muslim/features/azkar/presentation/views/widget/custom_card_zekr.dart';

class AzkarBodyView extends StatelessWidget {
  const AzkarBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              return CustomCardZekr(
                title: kAzkarCategory[index],
                onTap: () {
                  if (kAzkarCategory[index] == 'سبحة') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SebahaView()));
                  } else {
                    GoRouter.of(context).push(AppRouter.kZekrCategoryView,
                        extra: kAzkarCategory[index]);
                  }
                },
              );
            },
            itemCount: kAzkarCategory.length,
          ),
        ),
      ],
    );
  }
}
