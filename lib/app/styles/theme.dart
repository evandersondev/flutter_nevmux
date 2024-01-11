import 'package:flutter/material.dart';

class ThemeApp {
  const ThemeApp(this.context);

  final BuildContext context;

  ThemeData get dark => ThemeData(
        useMaterial3: false,
        primaryColor: Colors.black54,
        cardColor: Colors.grey.shade900,
        scaffoldBackgroundColor: Colors.black87,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  ThemeData get ligth => ThemeData(
        useMaterial3: false,
        primaryColor: Colors.white,
        cardColor: Colors.grey.shade200,
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black87),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
