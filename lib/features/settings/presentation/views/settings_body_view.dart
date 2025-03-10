import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/features/my_todos/views/my_todos_view.dart';
import 'package:muslim/features/settings/presentation/view_model/change_font_cubit/change_font_cubit.dart';
import 'package:muslim/features/settings/presentation/views/widgets/custom_card_languages.dart';
import 'package:muslim/features/settings/presentation/views/widgets/custom_switch.dart';

class SettingsBodyView extends StatelessWidget {
  const SettingsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 4),
          child: Text(
            translate(context).language,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const CustomCardLanguages(),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4),
              child: Text(
                translate(context).dark_mode,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Spacer(),
            const CustomSwitch(),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4),
              child: Text(
                translate(context).notifications,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Spacer(),
            BlocBuilder<ChangeNotificationCubit, ChangeNotfiactionState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(end: 24),
                  child: Switch(
                    activeTrackColor: Colors.indigo.shade400,
                    value: BlocProvider.of<ChangeNotificationCubit>(context)
                        .isEnabled,
                    onChanged: (value) {
                      BlocProvider.of<ChangeNotificationCubit>(context)
                          .changeNotification();
                    },
                  ),
                );
              },
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4),
              child: Text(
                translate(context).my_todos,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 24),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyTodosView(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
