import 'package:your_cinema/features/authentication/data/data_sources/firebase_auth_data_source.dart';
import 'package:your_cinema/features/authentication/data/data_sources/firebase_store_data_source.dart';
import 'package:your_cinema/features/authentication/data/models/user_account_model.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_params.dart';

import '../../domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl({
    required this.firebaseAuthDataSource,
    required this.firebaseStoreDataSource,
  });

  final FirebaseAuthDataSource firebaseAuthDataSource;
  final FirebaseStoreDataSource firebaseStoreDataSource;

  @override
  Future<UserAccountModel> createUserAccount(UserParams params) async {
    final user = await firebaseAuthDataSource.createUserAccount(params);
    await storeUserDetails(user);
    return user;
  }

  @override
  Future<UserAccountModel> loginUser(UserParams params) async {
    return firebaseAuthDataSource.loginUser(params);
  }

  @override
  Future<void> logOutUser() async {
    return firebaseAuthDataSource.logOutUser();
  }

  @override
  Future<void> storeUserDetails(covariant UserAccountModel user) async {
    return firebaseStoreDataSource.storeUserDetails(user);
  }

  @override
  Stream<UserAccountModel?> getCurrentUser() {
    return firebaseAuthDataSource.getCurrentUser().map((user) {
      if (user == null) return null;
      return UserAccountModel(
        id: user.uid,
        email: user.email ?? '',
        username: user.displayName ?? '',
        avatarPath: user.photoURL,
      );
    });
  }
}
