import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_params.dart';
import 'package:your_cinema/features/authentication/domain/usecases/sing_up_usecase.dart';

import 'package:your_cinema/core/helpers/dependency_container.dart' as dc;

final _singupUseCaseProvider = Provider<SignUpUsecase>((ref) {
  return dc.getIt<SignUpUsecase>();
});

final createAccountProvider = FutureProvider.family<void, UserParams>((
  ref,
  params,
) async {
  final usecase = ref.read(_singupUseCaseProvider);
  await usecase(params);
});
