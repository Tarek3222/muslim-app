import 'package:flutter/material.dart';
import 'package:muslim/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error, this.onPressed});
  final String error;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          error,
          style: AppStyles.textStyle19
              .copyWith(color: Colors.red, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary),
          child: Text(
            "Try Again",
            style: AppStyles.textStyle19
                .copyWith(color: Colors.red.shade600, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
