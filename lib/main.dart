import 'package:finlog/core/controllers/theme_controller.dart';
import 'package:finlog/core/routes/app_router.dart';
import 'package:finlog/modules/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themeController = ThemeController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinLog',
      routes: routes,
      theme: themeController.isDarkTheme ?  ThemeData.dark() : ThemeData.light(),
      home: HomeView(),
    );
  }
}
