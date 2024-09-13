import 'package:flutter/material.dart';
import 'package:muslim/features/settings/presentation/views/widgets/custm_drop_down_menu.dart';

class CustomCardLanguages extends StatelessWidget {
  const CustomCardLanguages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsetsDirectional.symmetric(vertical: 12, horizontal: 24),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade500),
      ),
      child: const CustmDropDownMenu(),
    );
  }
}
