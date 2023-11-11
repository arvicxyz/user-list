import 'package:user_list/src/features/user/views/details_view.dart';
import 'package:user_list/src/features/user/views/home_view.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String homeRoute = "/";
  static const String detailsRoute = "/details";

  static Map<String, Widget Function(BuildContext)> routes = {
    homeRoute: (_) => const HomeView(),
    detailsRoute: (_) => const DetailsView(),
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
