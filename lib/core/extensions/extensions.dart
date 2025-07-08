import 'package:flutter/material.dart';

extension Navigate<T> on BuildContext {
  Future<T?> pushNamed(String route) async {
    return await Navigator.of(this).pushNamed(route);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
