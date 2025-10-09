import 'package:firebase_auth/firebase_auth.dart';
import 'package:your_cinema/features/authentication/data/models/user_account_model.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_params.dart';

class FirebaseAuthDataSource {
  FirebaseAuthDataSource({required this.auth});

  final FirebaseAuth auth;

  Future<UserAccountModel> createUserAccount(UserParams params) async {
    UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    User user = credential.user!;
    await user.updateDisplayName(params.username);
    return UserAccountModel.fromFirebase(user: user, params: params);
  }

  Future<UserAccountModel> loginUser(UserParams params) async {
    UserCredential credential = await auth.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    User user = credential.user!;
    return UserAccountModel.fromFirebase(user: user, params: params);
  }

  Future<void> logOutUser() async {
    await auth.signOut();
  }

  Stream<User?> getCurrentUser() {
    final user = auth.authStateChanges();
    return user;
  }
}
