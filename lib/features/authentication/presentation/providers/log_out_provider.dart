import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/data/providers/users_repository_provider.dart';
import 'package:your_cinema/features/authentication/domain/usecases/log_out_user_use_case.dart';

final _logOUtUserUseCaseProvider = Provider<LogOutUserUseCase>((ref) {
  final repository = ref.watch(usersRepositoryProvider);
  return LogOutUserUseCase(repository: repository);
});

final logOutUserProvider = FutureProvider<void>((ref) async {
  final usecase = ref.read(_logOUtUserUseCaseProvider);

  await usecase();
});
