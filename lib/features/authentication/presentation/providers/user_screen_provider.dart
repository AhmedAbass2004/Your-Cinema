import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/presentation/providers/get_current_user_provider.dart';
import 'package:your_cinema/features/authentication/presentation/providers/log_out_provider.dart';
import 'package:your_cinema/features/authentication/presentation/screens/create_account_screen.dart';
import 'package:your_cinema/features/authentication/presentation/screens/user_details_screen.dart';

final userScreenProvider = Provider<Widget>((ref) {
  final userAsyncValue = ref.watch(getCurrentUserProvider);
  return userAsyncValue.when(
    data: (user) {
      if (user == null) {
        return const CreateAccountScreen();
      }
      return UserDetailsScreen(
        user: user,
        onLogOut: () {
          ref.invalidate(logOutUserProvider);
          ref.read(logOutUserProvider);
        },
      );
    },
    loading: () => const Center(child: CircularProgressIndicator()),
    error: (error, stack) => Center(child: Text('Error: $error')),
  );
});
