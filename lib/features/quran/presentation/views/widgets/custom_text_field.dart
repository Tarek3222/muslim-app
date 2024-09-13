import 'package:flutter/material.dart';
import 'package:muslim/core/constants/language_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.onChanged, this.controller});
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search,color: Theme.of(context).colorScheme.onSecondary,),
          hintText: translate(context).search_surah,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          border:const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
             borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
          ),
          contentPadding:const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        ),
      ),
    );
  }
}
