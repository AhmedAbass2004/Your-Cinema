import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/presentation/providers/get_current_user_provider.dart';

class UserAppBarIcon extends ConsumerWidget {
  const UserAppBarIcon({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userSyncValue = ref.watch(getCurrentUserProvider);
    Widget child = userSyncValue.when(
      data: (user) {
        if (user != null &&
            user.avatarPath != null &&
            user.avatarPath!.isNotEmpty) {
          return CircleAvatar(
            backgroundImage: AssetImage(user.avatarPath!),
            radius: 16,
          );
        } else {
          return Icon(
            Icons.account_circle,
            size: 36,
            color: Theme.of(context).colorScheme.primaryContainer,
          );
        }
      },
      error: (error, stackTrace) => const Icon(Icons.error),
      loading: () => const CircularProgressIndicator(),
    );
    return InkWell(onTap: onTap, child: child);
  }
}
