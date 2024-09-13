import 'package:flutter/material.dart';
import 'package:muslim/core/constants/language_constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.currentIndex, this.onTap});
  final int currentIndex ;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          currentIndex: currentIndex,
          items:  [
            BottomNavigationBarItem(
              icon:const ImageIcon(
                AssetImage(
                  "assets/images/quran_bottom_nav_icon.png",
                ),
              ),
              label: translate(context).quran,
            ),
            BottomNavigationBarItem(
              icon:const ImageIcon(
                AssetImage(
                  "assets/images/ahadeth_bottom_nav_icon.png",
                ),
              ),
              label: translate(context).ahadeth,
            ),
            BottomNavigationBarItem(
              icon:const Icon(Icons.menu_book),
              label: translate(context).azkar,
            ),
            BottomNavigationBarItem(
              icon:const ImageIcon(
                AssetImage(
                  "assets/images/sebha_bottom_nav_icon.png",
                ),
              ),
              label: translate(context).tasbeh,
            ),
            BottomNavigationBarItem(
              icon:const Icon(Icons.settings),
              label: translate(context).settings,
            ),
          ],
          onTap: onTap,
        );
  }
}