import 'package:flutter/material.dart';

class CustomOnePrayerTimeLoad extends StatelessWidget {
  const CustomOnePrayerTimeLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Fajr",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade900),
        ),
        const Spacer(),
        Text(
          "05:07 AM",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade900),
        ),
      ],
    );
  }
}
