import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_account.dart';
import 'package:your_cinema/features/authentication/domain/usecases/get_current_user_use_case.dart';

import 'package:your_cinema/core/helpers/dependency_container.dart' as dc;

final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ref) {
  return dc.getIt<GetCurrentUserUseCase>();
});

final getCurrentUserProvider = StreamProvider<UserAccount?>((ref) {
  final usecase = ref.read(getCurrentUserUseCaseProvider);
  return usecase();
});
