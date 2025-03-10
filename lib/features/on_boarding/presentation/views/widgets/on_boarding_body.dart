import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/core/helper/cache_helper.dart';
import 'package:muslim/core/utils/app_router.dart';
import 'package:muslim/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:muslim/features/on_boarding/presentation/views/widgets/build_dots_indecator.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  bool isOut = false;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(onBoardingList[currentPage].image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          Container(
            padding:
                const EdgeInsets.only(top: 24, left: 12, right: 12, bottom: 12),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                AnimatedScale(
                  duration: const Duration(milliseconds: 450),
                  scale: isOut ? 0 : 1,
                  child: Text(
                    onBoardingList[currentPage].title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                AnimatedScale(
                  duration: const Duration(milliseconds: 450),
                  scale: isOut ? 0 : 1,
                  child: Text(
                    onBoardingList[currentPage].description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          CacheHelper.saveData(
                              key: 'isFirstLaunch', value: false);
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.kHomeView);
                        },
                        child: const Text(
                          'تخطي',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (currentPage < onBoardingList.length - 1) {
                              setState(() {
                                isOut = true;
                              });
                              Timer(
                                const Duration(microseconds: 500),
                                () => setState(() {
                                  isOut = false;
                                  currentPage++;
                                }),
                              );
                            } else {
                              CacheHelper.saveData(
                                  key: 'isFirstLaunch', value: false);
                              GoRouter.of(context)
                                  .pushReplacement(AppRouter.kHomeView);
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const StadiumBorder(
                            side: BorderSide(
                              color: Color(0xffB7935F),
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Text(
                          'متابعة',
                          style: TextStyle(
                            color: Color(0xffB7935F),
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          BuildDotsIndecator(
            onBoardingList: onBoardingList,
            currentPage: currentPage,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
