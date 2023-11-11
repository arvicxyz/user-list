import 'package:flutter/material.dart';
import 'colors.dart';

class StyleConstants {
  // Text Styles

  static const TextStyle defaultLightTextStyle = TextStyle(
    color: ColorConstants.primaryTextColor,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle textFieldTextStyle = TextStyle(
    color: ColorConstants.textFieldTextColor,
    fontSize: 14,
  );

  static const TextStyle textFieldHintTextStyle = TextStyle(
    color: ColorConstants.textFieldHintColor,
    fontSize: 14,
  );

  static const TextStyle titleTextStyle = TextStyle(
    color: ColorConstants.whiteTextColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  // Button Styles

  static const ButtonStyle buttonStyle = ButtonStyle(
    padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
    backgroundColor: MaterialStatePropertyAll(ColorConstants.buttonColor),
  );

  static const TextStyle buttonTextStyle = TextStyle(
    color: ColorConstants.whiteTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
