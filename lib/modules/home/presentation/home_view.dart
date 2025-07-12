import 'package:finlog/core/controllers/theme_controller.dart';
import 'package:finlog/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Finanças',
        onThemeChanged: () {
          themeController.toggleTheme();
        },
      ),
    );
  }
}
