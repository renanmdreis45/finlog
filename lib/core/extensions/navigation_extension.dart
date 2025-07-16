import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<T?> pushNamed<T>(String route) async {
    return await Navigator.of(this).pushNamed(route);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
