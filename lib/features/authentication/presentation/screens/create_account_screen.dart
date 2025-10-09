import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_params.dart';
import 'package:your_cinema/features/authentication/presentation/providers/avatars_provider.dart';
import 'package:your_cinema/features/authentication/presentation/providers/create_account_provider.dart';
import 'package:your_cinema/features/authentication/presentation/widgets/avatar_dialog.dart';
import 'package:your_cinema/features/authentication/presentation/widgets/avatar_picker.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  final formKey = GlobalKey<FormState>();
  String? email, username, password, avatarPath;

  Future<void> showAvatarDialog(List<String> paths) async {
    await showDialog(
      context: context,
      builder: (context) => AvatarDialog(paths: paths, onSelect: onSelect),
    );
  }

  void onSelect(String path) {
    avatarPath = path;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<String> paths = ref.watch(avatarsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: Form(
        child: Column(
          children: [
            AvatarPicker(
              image: avatarPath ?? paths[0],
              onTap: () {
                showAvatarDialog(paths);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(decoration: const InputDecoration(labelText: 'Password')),
            ElevatedButton(
              onPressed: () async {
                if (!formKey.currentState!.validate()) {
                  return;
                }
                await ref.read(
                  createAccountProvider(
                    UserParams(
                      email: email!,
                      password: password!,
                      username: username!,
                      avatarPath: avatarPath,
                    ),
                  ).future,
                );
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
