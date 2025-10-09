import 'package:your_cinema/features/authentication/domain/entities/user_account.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_params.dart';

abstract class UsersRepository {
  Future<UserAccount> createUserAccount(UserParams params);

  Future<UserAccount> loginUser(UserParams params);

  Future<void> storeUserDetails(UserAccount user);

  Future<void> logOutUser();

  Stream<UserAccount?> getCurrentUser();
}
