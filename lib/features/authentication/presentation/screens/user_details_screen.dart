import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_cinema/core/theme/text_styles.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80.r,
              backgroundImage: AssetImage(
                user.avatarPath ?? 'assets/user_avatars/user_avatar_0.jpg',
              ),
            ),
            SizedBox(height: 16),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(user.email, style: TextStyles.font16RegulerWhite),
            ),

            ListTile(
              leading: const Icon(Icons.bookmark),
              title: Text('Watch List', style: TextStyles.font16RegulerWhite),
            ),

            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: onLogOut,
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: onLogOut, child: const Text('Log Out')),
          ],
        ),
      ),
    );
  }
}
