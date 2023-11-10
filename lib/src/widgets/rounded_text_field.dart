import 'package:user_list/src/constants/styles.dart';
import 'package:user_list/src/constants/colors.dart';
import 'package:user_list/src/localization/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:user_list/src/constants/dimens.dart';

class RoundedTextField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? child;

  const RoundedTextField({
    super.key,
    this.hintText,
    this.icon,
    this.keyboardType,
    this.controller,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.textFieldColor,
        borderRadius: BorderRadius.circular(DimenConstants.defaultBorderRadius),
      ),
      child: child ??
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(),
              prefixIcon: Container(
                margin: AppLocale.isRtl(context)
                    ? const EdgeInsets.only(left: DimenConstants.prefixIconRightMargin)
                    : const EdgeInsets.only(right: DimenConstants.prefixIconRightMargin),
                child: icon != null
                    ? Icon(
                        icon,
                        color: Colors.black54,
                      )
                    : const SizedBox(),
              ),
              hintText: hintText,
              hintStyle: StyleConstants.textFieldHintTextStyle,
              border: const OutlineInputBorder(),
            ),
            style: StyleConstants.textFieldTextStyle,
          ),
    );
  }
}
