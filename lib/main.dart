import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:my_portfolio/core/theme/theme.dart';
import 'package:my_portfolio/core/util/router.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColor.scaffold,
        textTheme: Styles.textTheme(ThemeData.dark().textTheme),
        colorScheme: const ColorScheme.dark(
          surface: AppColor.surface,
          primary: AppColor.primary,
          onPrimary: AppColor.onPrimary,
        ),
      ),
      routerConfig: appRouter,
    );
  }
}
