import 'package:your_cinema/features/authentication/domain/entities/user_account.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_params.dart';
import 'package:your_cinema/features/authentication/domain/repositories/users_repository.dart';

class LoginUsecase {
  final UsersRepository repository;

  LoginUsecase(this.repository);

  Future<UserAccount> call(UserParams params) async {
    return repository.loginUser(params);
  }
}
