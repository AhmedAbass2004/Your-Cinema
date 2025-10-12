import 'package:your_cinema/features/authentication/domain/entities/user_account.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_params.dart';
import 'package:your_cinema/features/authentication/domain/repositories/users_repository.dart';

class SignUpUsecase {
  SignUpUsecase({required this.repository});

  final UsersRepository repository;

  Future<UserAccount> call(UserParams params) async {
    final user = await repository.createUserAccount(params);
    return user;
  }
}
