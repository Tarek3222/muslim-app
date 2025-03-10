import 'package:flutter/material.dart';
import 'package:muslim/features/tasbeh/presentation/views/tasbeh__body_view.dart';

class SebahaView extends StatelessWidget {
  const SebahaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text(
          "سبحة",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: const TasbehBodyView(),
    );
  }
}
