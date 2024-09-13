import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.padding,
      this.minimumSize,
      this.width,
      this.height, this.onPressed});
  final EdgeInsetsGeometry padding;
  final Size? minimumSize;
  final double? width;
  final double? height;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade600,
          shape: const CircleBorder(),
          minimumSize: minimumSize,
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade400,
              border: Border.all(
                color: Colors.grey.shade500,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade50,
                  spreadRadius: 1.4,
                  blurRadius: 12,
                ),
              ]),
        ),
      ),
    );
  }
}
