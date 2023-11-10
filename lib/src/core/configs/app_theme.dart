import 'dart:ui';
import 'package:user_list/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.primaryColor),
      fontFamily: _getFontFamily(),
      appBarTheme: _getAppBarTheme(),
      textTheme: _getTextTheme(const TextTheme()),
    );
  }

  static String? _getFontFamily() => GoogleFonts.poppins().fontFamily;

  static AppBarTheme _getAppBarTheme() {
    return const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  static TextTheme _getTextTheme(TextTheme theme) {
    var style = TextStyle(
      fontFamily: _getFontFamily(),
      fontFeatures: const [FontFeature.proportionalFigures()],
    );
    return theme.merge(
      TextTheme(
        displayLarge: style,
        displayMedium: style,
        displaySmall: style,
        headlineLarge: style,
        headlineMedium: style,
        headlineSmall: style,
        titleLarge: style,
        titleMedium: style,
        titleSmall: style,
        bodyLarge: style,
        bodyMedium: style,
        bodySmall: style,
        labelLarge: style,
        labelMedium: style,
        labelSmall: style,
      ),
    );
  }
}
