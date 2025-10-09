import 'package:flutter/material.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_account.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({
    super.key,
    required this.user,
    required this.onLogOut,
  });

  final UserAccount user;
  final void Function() onLogOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.username)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User ID: ${user.id}',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${user.email}',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: onLogOut, child: const Text('Log Out')),
          ],
        ),
      ),
    );
  }
}
