import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/features/settings/presentation/view_model/change_theme_cubit/change_theme_cubit.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 24),
      child: Switch(
        activeTrackColor: Colors.indigo.shade400,
        value: BlocProvider.of<ChangeThemeCubit>(context).isDarkMode,
        onChanged: (value) {
          BlocProvider.of<ChangeThemeCubit>(context).changeTheme();
          setState(() {});
        },
      ),
    );
  }
}