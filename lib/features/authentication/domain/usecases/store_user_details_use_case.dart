import 'package:your_cinema/features/authentication/domain/entities/user_account.dart';
import 'package:your_cinema/features/authentication/domain/repositories/users_repository.dart';

class StoreUserDetailsUseCase {
  final UsersRepository repository;

  StoreUserDetailsUseCase(this.repository);

  Future<void> call(UserAccount user) async {
    return await repository.storeUserDetails(user);
  }
}
