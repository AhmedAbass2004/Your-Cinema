import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/data/data_sources/user_avatar_data_source.dart';

final avatarsProvider = Provider<List<String>>((ref) => userAvatars);
