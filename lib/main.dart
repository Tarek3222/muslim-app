// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:muslim/core/Themes/themes.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/core/helper/cache_helper.dart';
import 'package:muslim/core/helper/local_notifications_service.dart';
import 'package:muslim/core/utils/app_router.dart';
import 'package:muslim/features/my_todos/data/models/my_todo_model.dart';
import 'package:muslim/features/my_todos/logic/todos_cubit/todos_cubit.dart';
import 'package:muslim/features/settings/presentation/view_model/change_font_cubit/change_font_cubit.dart';
import 'package:muslim/features/settings/presentation/view_model/change_theme_cubit/change_theme_cubit.dart';
import 'package:muslim/features/settings/presentation/view_model/change_theme_cubit/change_theme_state.dart';
import 'package:muslim/features/tasbeh/presentation/view_model/change_count_and_save_cubit/change_count_and_save_cubit.dart';
import 'package:muslim/hive/hive_registrar.g.dart';
import 'package:quran_library/quran_library.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDocumentDir = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapters();
  await Future.wait([
    QuranLibrary().init(),
    CacheHelper.init(),
    Hive.openBox<MyTodoModel>('my_todos'),
    LocalNotificationsService.init(),
  ]);
  runApp(const MuslimApp());
}

class MuslimApp extends StatefulWidget {
  const MuslimApp({super.key});

  @override
  State<MuslimApp> createState() => _MuslimAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MuslimAppState? state = context.findAncestorStateOfType<_MuslimAppState>();
    state?.setLocale(newLocale);
  }
}

class _MuslimAppState extends State<MuslimApp> {
  Locale? _locale;

  void setLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  void initState() {
    LocalNotificationsService.requestPermissionInitial();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChangeThemeCubit()..init(),
        ),
        BlocProvider(
          create: (context) => ChangeNotificationCubit()..init(),
        ),
        BlocProvider(
          create: (context) => ChangeCountAndSaveCubit()..init(),
        ),
        BlocProvider(
          create: (context) => TodosCubit(),
        )
      ],
      child: Builder(builder: (context) {
        return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              routerConfig: AppRouter.router,
              title: 'Muslim App',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
              locale: _locale,
              theme: BlocProvider.of<ChangeThemeCubit>(context).isDarkMode
                  ? Themes.darkTheme
                  : Themes.lightTheme,
            );
          },
        );
      }),
    );
  }
}
