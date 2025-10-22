import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/data/providers/users_repository_provider.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_params.dart';
import 'package:your_cinema/features/authentication/domain/usecases/sing_up_usecase.dart';

final _singupUseCaseProvider = Provider<SignUpUsecase>((ref) {
  final repository = ref.watch(usersRepositoryProvider);
  return SignUpUsecase(repository: repository);
});

final createAccountProvider = FutureProvider.family<void, UserParams>((
  ref,
  params,
) async {
  final usecase = ref.read(_singupUseCaseProvider);
  await usecase(params);
});
