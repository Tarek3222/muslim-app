import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppLocalizations translate(context) => AppLocalizations.of(context)!;
const String kMainFontFamily="GT Sectra Fine";

const String kLAGUAGECODE = 'languageCode';

//languages code
const String kENGLISH = 'en';
const String kARABIC = 'ar';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(kLAGUAGECODE, languageCode);
  return locale(languageCode);
}

Locale locale(String languageCode) {
  switch (languageCode) {
    case kENGLISH:
      return const Locale(kENGLISH);
    case kARABIC:
      return const Locale(kARABIC);
    default:
      return const Locale(kENGLISH);
  }
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(kLAGUAGECODE) ?? kENGLISH;
  return locale(languageCode);
}