import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaterialAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget icon;
  final Color iconColor;
  final VoidCallback? iconOnPressed;
  final Color backgroundColor;
  final double elevation;
  final SystemUiOverlayStyle overlayStyle;
  final List<Widget>? actions;

  const MaterialAppBar({
    super.key,
    this.leading,
    this.icon = const Icon(Icons.arrow_back_ios_new),
    this.iconColor = Colors.white,
    this.iconOnPressed,
    this.backgroundColor = Colors.transparent,
    this.elevation = 0,
    this.overlayStyle = SystemUiOverlayStyle.dark,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ??
          IconButton(
            icon: icon,
            color: iconColor,
            onPressed: iconOnPressed ?? () => Navigator.pop(context),
          ),
      backgroundColor: backgroundColor,
      elevation: elevation,
      systemOverlayStyle: overlayStyle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
