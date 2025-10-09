import 'package:firebase_auth/firebase_auth.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_account.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_params.dart';

class UserAccountModel extends UserAccount {
  UserAccountModel({
    required super.id,
    required super.username,
    required super.email,
    super.avatarPath,
  });

  factory UserAccountModel.fromFirebase({
    required User user,
    required UserParams params,
  }) {
    return UserAccountModel(
      id: user.uid,
      email: params.email,
      username: params.username,
      avatarPath: params.avatarPath,
    );
  }
}
