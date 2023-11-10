import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_list/src/core/configs/app_theme.dart';
import 'package:user_list/src/core/responsive.dart';
import 'package:user_list/src/localization/app_locale.dart';
import 'package:user_list/src/routing/app_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  ResponsiveScreen.init();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobii - User List',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocale.localizationsDelegates,
      supportedLocales: AppLocale.supportedLocales,
      theme: AppTheme.getTheme(),
      initialRoute: AppRoute.getInitialRoute(),
      routes: AppRoute.routes,
    );
  }
}
