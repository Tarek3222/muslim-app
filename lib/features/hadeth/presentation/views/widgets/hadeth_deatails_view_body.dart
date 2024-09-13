import 'package:flutter/material.dart';
import 'package:muslim/features/hadeth/data/models/hadeth_model.dart';

class HadethDeatailsViewBody extends StatelessWidget {
  const HadethDeatailsViewBody({super.key, required this.hadeth});
  final HadethModel hadeth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: 60,
      ),
      padding:const EdgeInsets.all(20),
      decoration:  BoxDecoration(
        borderRadius:const BorderRadius.all(Radius.circular(20),),
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary,),
      ),
      child: SingleChildScrollView(
        child: Text(
          hadeth.content,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}