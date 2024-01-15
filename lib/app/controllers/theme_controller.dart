import 'package:flutter/material.dart';

import 'package:flutter_nexmuv/app/services/shared_preferences_service.dart';

class ThemeController {
  static final ThemeController instance = ThemeController._();

  ThemeController._() {
    init();
  }

  final localStorage = SharedPreferencesService();
  final isDark = ValueNotifier<bool>(false);

  void init() async {
    final storageTheme = await localStorage.get(key: 'nexmuv@theme');

    if (storageTheme != null) {
      isDark.value = bool.parse(storageTheme);
    }
  }

  void toggleTheme() async {
    await localStorage.put(
      key: 'nexmuv@theme',
      value: '${!isDark.value}',
    );

    isDark.value = !isDark.value;
  }
}
