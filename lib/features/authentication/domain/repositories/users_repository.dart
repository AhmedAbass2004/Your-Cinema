import 'package:your_cinema/features/authentication/domain/entities/login_credentials.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_account.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_params.dart';

abstract class UsersRepository {
  Future<UserAccount> createUserAccount(UserParams params);

  Future<void> loginUser(LoginCredentials params);

  Future<void> storeUserDetails(UserAccount user);

  Future<void> logOutUser();

  Stream<UserAccount?> getCurrentUser();
}
