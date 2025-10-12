import 'package:flutter/material.dart';
import 'package:your_cinema/core/theme/app_theme.dart';
import 'package:your_cinema/features/movies/presentation/screens/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const HomePage());
  }
}
