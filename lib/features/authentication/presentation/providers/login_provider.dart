import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/data/providers/users_repository_provider.dart';
import 'package:your_cinema/features/authentication/domain/entities/login_credentials.dart';
import 'package:your_cinema/features/authentication/domain/usecases/login_usecase.dart';

final _loginUseCaseProvider = Provider<LoginUsecase>((ref) {
  final repository = ref.watch(usersRepositoryProvider);
  return LoginUsecase(repository: repository);
});

final loginProvider = FutureProvider.family<void, LoginCredentials>((
  ref,
  params,
) async {
  final usecase = ref.read(_loginUseCaseProvider);
  await usecase(params);
});
