import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/my_app.dart';
import 'package:your_cinema/core/helpers/dependency_container.dart' as dc;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  dc.init();
  runApp(const ProviderScope(child: MyApp()));
}
