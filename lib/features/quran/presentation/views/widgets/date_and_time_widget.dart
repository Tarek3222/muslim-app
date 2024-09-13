import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muslim/core/utils/styles.dart';

class DateAndTimeWidget extends StatelessWidget {
  const DateAndTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: 40,
      start: 50,
      child: StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          return Text(
            '${DateFormat('d/M/yyyy\t\t\t\t\t\t\t\t\t\th:mm:ss').format(
              DateTime.now(),
            )} ${TimeOfDay.now().period.name}',
            style: AppStyles.textStyle19,
          );
        },
      ),
    );
  }
}
