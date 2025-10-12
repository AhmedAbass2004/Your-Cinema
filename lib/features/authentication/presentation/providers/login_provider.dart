import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/domain/entities/login_credentials.dart';
import 'package:your_cinema/features/authentication/domain/usecases/login_usecase.dart';

import 'package:your_cinema/core/helpers/dependency_container.dart' as dc;

final _loginUseCaseProvider = Provider<LoginUsecase>((ref) {
  return dc.getIt<LoginUsecase>();
});

final loginProvider = FutureProvider.family<void, LoginCredentials>((
  ref,
  params,
) async {
  final usecase = ref.read(_loginUseCaseProvider);
  await usecase(params);
});
