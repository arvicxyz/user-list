import 'package:user_list/src/features/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String homeRoute = "/";

  static Map<String, Widget Function(BuildContext)> routes = {
    homeRoute: (context) => const HomeScreen(),
  };

  static String getInitialRoute() => homeRoute;

  static void navigate(BuildContext context, String routeName, {Object? arguments}) {
    var currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute == routeName) return;
    Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }
}
