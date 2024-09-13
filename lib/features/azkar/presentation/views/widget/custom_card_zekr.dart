import 'package:flutter/material.dart';

class CustomCardZekr extends StatelessWidget {
  const CustomCardZekr({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          child: Row(
            children: [
               Icon(
                Icons.arrow_back_ios_rounded,
                color:Theme.of(context).colorScheme.onPrimary,
                size: 22,
              ),
              const Spacer(),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
