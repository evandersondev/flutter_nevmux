import 'package:flutter/material.dart';

class ThemeController {
  static final ThemeController instance = ThemeController._();

  ThemeController._();

  final isDark = ValueNotifier<bool>(false);

  void toggleTheme() {
    isDark.value = !isDark.value;
  }
}
