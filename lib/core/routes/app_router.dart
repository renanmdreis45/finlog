import 'package:finlog/core/routes/routes.dart';
import 'package:finlog/modules/home/presentation/home_view.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  Routes.home: (BuildContext context) => HomeView(),
};
