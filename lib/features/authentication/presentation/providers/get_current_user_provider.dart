import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/data/providers/users_repository_provider.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_account.dart';
import 'package:your_cinema/features/authentication/domain/usecases/get_current_user_use_case.dart';

final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ref) {
  final repository = ref.watch(usersRepositoryProvider);
  return GetCurrentUserUseCase(repository: repository);
});

final getCurrentUserProvider = StreamProvider<UserAccount?>((ref) {
  final usecase = ref.read(getCurrentUserUseCaseProvider);
  return usecase();
});
