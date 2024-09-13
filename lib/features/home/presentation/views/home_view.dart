import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:muslim/features/settings/presentation/view_model/change_theme_cubit/change_theme_cubit.dart';
import 'package:muslim/features/settings/presentation/view_model/change_theme_cubit/change_theme_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: BlocProvider.of<ChangeThemeCubit>(context).isDarkMode
                ? const AssetImage('assets/images/background_dark.png')
                : const AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          )),
          child: const HomeViewBody(),
        );
      },
    );
  }
}
