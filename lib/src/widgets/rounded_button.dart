import 'package:user_list/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:user_list/src/constants/dimens.dart';
import 'package:user_list/src/constants/styles.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color color;
  final VoidCallback onPressed;

  const RoundedButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.textColor = ColorConstants.whiteTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: DimenConstants.defaultButtonPadding,
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(DimenConstants.defaultBorderRadius),
          ),
        ),
      ),
      child: Text(
        text,
        style: StyleConstants.buttonTextStyle.copyWith(color: textColor),
      ),
    );
  }
}
