import 'package:flutter/material.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/features/hadeth/presentation/views/widgets/ahadeth_list_view.dart';

class HadethBodyView extends StatelessWidget {
  const HadethBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/ahadeth_header.png',
          width: mediaQuery.width * 0.87,
          height: mediaQuery.height * 0.34,
          fit: BoxFit.fill,
        ),
        Divider(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        Text(
          translate(context).ahadeth,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Divider(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        const Expanded(
          child: AhadethListView(),
        ),
      ],
    );
  }
}
