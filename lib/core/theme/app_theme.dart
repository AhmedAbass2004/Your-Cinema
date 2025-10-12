import 'package:flutter/material.dart';
import 'package:your_cinema/core/theme/colors.dart';

final colorScheme = ColorScheme.fromSeed(seedColor: Colors.blueAccent).copyWith(
  primary: primaryColor,
  surface: surfaceColor,
  primaryContainer: primaryContainerColor,
  onSurface: onSurface,
);

final inputDecoration = InputDecorationTheme().copyWith(
  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
  fillColor: const Color.fromARGB(71, 217, 217, 217),
  filled: true,
  hoverColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(style: BorderStyle.none),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(style: BorderStyle.none),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.black),
  ),
);

final theme = ThemeData(
  colorScheme: colorScheme,
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 26),
    titleMedium: TextStyle(fontSize: 22),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: colorScheme.surface,
    foregroundColor: Colors.white,
    centerTitle: true,
    actionsPadding: EdgeInsets.only(right: 8),
  ),
  iconTheme: IconThemeData(color: colorScheme.primaryContainer),
  scaffoldBackgroundColor: colorScheme.surface,
  inputDecorationTheme: inputDecoration,
);
