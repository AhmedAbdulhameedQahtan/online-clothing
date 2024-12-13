import 'package:flutter/material.dart';
import 'package:online_clothing/resources/theme_manager.dart';
import 'package:online_clothing/view/splash_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //   localizationsDelegates: context.localizationDelegates,
      //   supportedLocales: context.supportedLocales,
      //   locale: context.locale,
      //   debugShowCheckedModeBanner: false,
      //   onGenerateRoute: RoutGenerator.getRoute,
      //   initialRoute: Routes.splashRoute,
      //   theme: AppThemes.lightTheme,
      //   darkTheme: AppThemes.darkTheme,
      //   themeMode: ThemeMode.system,
      // );
      // return  MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   onGenerateRoute: RoutGenerator.getRoute,
      //   initialRoute: Routes.splashRoute,
      //   theme: getApplicationTheme(),
      //   ===============================
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      home:const SplashPageView(),
    );
  }
}
