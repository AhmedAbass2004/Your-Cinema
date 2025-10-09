import 'package:flutter/material.dart';
import 'package:your_cinema/core/theme/colors.dart';

final colorScheme = ColorScheme.fromSeed(seedColor: Colors.blueAccent).copyWith(
  primary: primaryColor,
  surface: surfaceColor,
  primaryContainer: primaryContainerColor,
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
);
