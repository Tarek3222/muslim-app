import 'package:flutter/material.dart';
import 'package:muslim/features/on_boarding/data/models/on_boarding_model.dart';

class BuildDotsIndecator extends StatelessWidget {
  const BuildDotsIndecator(
      {super.key, required this.onBoardingList, required this.currentPage});
  final List<OnBoardingModel> onBoardingList;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onBoardingList.length,
        (index) => buildDot(selectedPage: currentPage == index),
      ),
    );
  }

  buildDot({required bool selectedPage}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 8,
      width: selectedPage ? 30 : 7,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selectedPage ? const Color(0xffB7935F) : Colors.white,
      ),
    );
  }
}
