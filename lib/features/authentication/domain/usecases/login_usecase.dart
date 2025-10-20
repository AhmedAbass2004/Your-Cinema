import 'package:your_cinema/features/authentication/domain/entities/login_credentials.dart';
import 'package:your_cinema/features/authentication/domain/repositories/users_repository.dart';

class LoginUsecase {
  final UsersRepository repository;

  LoginUsecase({required this.repository});

  Future<void> call(LoginCredentials params) async {
    return repository.loginUser(params);
  }
}
