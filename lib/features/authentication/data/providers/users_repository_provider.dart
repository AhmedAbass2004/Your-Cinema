import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/data/providers/firebase_auth_data_source_provider.dart';
import 'package:your_cinema/features/authentication/data/providers/firebase_firestore_data_source_provider.dart';
import 'package:your_cinema/features/authentication/data/repositories/users_repository_impl.dart';
import 'package:your_cinema/features/authentication/domain/repositories/users_repository.dart';

final usersRepositoryProvider = Provider<UsersRepository>((ref) {
  final firebaseAuthDataSource = ref.watch(firebaseAuthDataSourceProvider);
  final firebaseStoreDataSource = ref.watch(firebaseStoreDataSourceProvider);
  return UsersRepositoryImpl(
    firebaseAuthDataSource: firebaseAuthDataSource,
    firebaseStoreDataSource: firebaseStoreDataSource,
  );
});
