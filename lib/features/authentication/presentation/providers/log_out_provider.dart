import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/domain/usecases/log_out_user_use_case.dart';

import 'package:your_cinema/core/helpers/dependency_container.dart' as dc;

final _logOUtUserUseCaseProvider = Provider<LogOutUserUseCase>((ref) {
  return dc.getIt<LogOutUserUseCase>();
});

final logOutUserProvider = FutureProvider<void>((ref) async {
  final usecase = ref.read(_logOUtUserUseCaseProvider);

  await usecase();
});
