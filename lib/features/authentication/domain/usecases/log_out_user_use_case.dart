import 'package:your_cinema/features/authentication/domain/repositories/users_repository.dart';

class LogOutUserUseCase {
  final UsersRepository repository;

  LogOutUserUseCase({required this.repository});

  Future<void> call() async {
    return repository.logOutUser();
  }
}
