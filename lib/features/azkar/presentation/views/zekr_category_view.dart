import 'package:flutter/material.dart';
import 'package:muslim/features/azkar/presentation/views/widget/zekr_category_view_body.dart';

class ZekrCategoryView extends StatelessWidget {
  const ZekrCategoryView({super.key, required this.categoryZekr});
  final String categoryZekr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(categoryZekr,style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:  Icon(Icons.arrow_back_ios_rounded,color: Theme.of(context).colorScheme.onPrimary,),
        ),
      ),
      body:  ZekrCategoryViewBody(category:categoryZekr ),
    );
  }
}