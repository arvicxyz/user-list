import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocale {
  static Iterable<Locale> supportedLocales = const [
    Locale('en', ''),
    Locale('ar', ''),
  ];

  static Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static AppLocalizations of(context) {
    var locale = AppLocalizations.of(context)!;
    return locale;
  }

  static bool isRtl(context) {
    return Localizations.localeOf(context).languageCode.contains("ar");
  }
}
