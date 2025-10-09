import 'package:flutter_dotenv/flutter_dotenv.dart';

final String kToken = dotenv.env['TMDB_TOKEN']!;

const String kImageBaseUrl = "https://image.tmdb.org/t/p/w500";
