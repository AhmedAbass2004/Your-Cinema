import 'package:your_cinema/features/authentication/domain/entities/user_account.dart';
import 'package:your_cinema/features/authentication/domain/repositories/users_repository.dart';

class GetCurrentUserUseCase {
  GetCurrentUserUseCase({required this.repository});
  final UsersRepository repository;

  Stream<UserAccount?> call() {
    return repository.getCurrentUser();
  }
}
