import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/domain/entities/user_params.dart';
import 'package:your_cinema/features/authentication/presentation/providers/avatars_provider.dart';
import 'package:your_cinema/features/authentication/presentation/providers/create_account_provider.dart';
import 'package:your_cinema/features/authentication/presentation/providers/selected_avatar_provider.dart';
import 'package:your_cinema/features/authentication/presentation/widgets/avatar_picker.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final formKey = GlobalKey<FormState>();
  String? email, username, password, confirmedPassword, avatarPath;
  bool obscurePassord = true;
  bool obscureConfirmedPassword = true;

  late ThemeData theme;
  late ColorScheme colorScheme;

  void navigateToLoginPage() {
    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    theme = Theme.of(context);
    colorScheme = theme.colorScheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.primaryContainer,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Create Account',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: colorScheme.surface,
                    fontSize: 36,
                  ),
                ),

                SizedBox(height: 16),

                Consumer(
                  builder: (context, ref, _) {
                    final image = ref.watch(selectedAvatarProvider);
                    final List<String> paths = ref.watch(avatarsProvider);
                    return AvatarPicker(
                      image: image,
                      onTap: () {
                        ref
                            .read(selectedAvatarProvider.notifier)
                            .showAvatarSelectionDialog(context, ref, paths);
                      },
                    );
                  },
                ),

                SizedBox(height: 64),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        !value.contains('@')) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value;
                  },
                ),

                SizedBox(height: 38),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        value.length < 4) {
                      return "Username must contain atleast 4 characters";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    username = value;
                  },
                ),

                SizedBox(height: 38),

                TextFormField(
                  obscureText: obscurePassord,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassord
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassord = !obscurePassord;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        value.length < 8) {
                      return "Password must contain atleast 8 characters";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    password = value;
                  },
                ),

                SizedBox(height: 38),

                TextFormField(
                  obscureText: obscureConfirmedPassword,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureConfirmedPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureConfirmedPassword = !obscureConfirmedPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value != password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    confirmedPassword = value;
                  },
                ),

                SizedBox(height: 38),

                Consumer(
                  builder: (context, ref, _) => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        formKey.currentState!.save();
                        avatarPath = ref.read(selectedAvatarProvider);
                        try {
                          await ref.read(
                            createAccountProvider(
                              UserParams(
                                email: email!,
                                password: confirmedPassword!,
                                username: username!,
                                avatarPath: avatarPath,
                              ),
                            ).future,
                          );
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        } catch (error) {
                          log(error.toString());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        backgroundColor: colorScheme.surface,
                        foregroundColor: colorScheme.primaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Create Account',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: colorScheme.primaryContainer,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an acount?',
                      style: theme.textTheme.bodyLarge,
                    ),
                    TextButton(
                      onPressed: navigateToLoginPage,
                      child: Text(
                        'Login',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
