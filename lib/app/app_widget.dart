import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_nexmuv/app/controllers/theme_controller.dart';
import 'package:flutter_nexmuv/app/pages/home/home_page.dart';
import 'package:flutter_nexmuv/app/styles/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return AnimatedBuilder(
      animation: ThemeController.instance,
      builder: (context, _) {
        return MaterialApp(
          title: 'Cryptos',
          debugShowCheckedModeBanner: false,
          theme: ThemeController.instance.isDark
              ? ThemeApp(context).dark
              : ThemeApp(context).ligth,
          themeMode: ThemeMode.dark,
          home: const HomePage(),
        );
      },
    );
  }
}
