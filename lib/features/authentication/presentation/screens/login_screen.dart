import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/domain/entities/login_credentials.dart';
import 'package:your_cinema/features/authentication/presentation/providers/login_provider.dart';
import 'package:your_cinema/features/authentication/presentation/screens/create_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController, passwordController;
  bool obscurePassord = true;

  late ThemeData theme;
  late ColorScheme colorScheme;

  void _login(WidgetRef ref) async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      return;
    }
    try {
      await ref.read(
        loginProvider(
          LoginCredentials(
            email: emailController.text,
            password: passwordController.text,
          ),
        ).future,
      );
    } catch (e) {
      if (mounted) {
        log(e.toString());
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  void _navigateToCreateAccountScreen() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => CreateAccountScreen()));
  }

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    theme = Theme.of(context);
    colorScheme = theme.colorScheme;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.primaryContainer,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Sing In',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: colorScheme.surface,
                  fontSize: 36,
                ),
              ),

              SizedBox(height: 120),

              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),

              SizedBox(height: 38),

              TextField(
                controller: passwordController,
                obscureText: obscurePassord,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassord ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassord = !obscurePassord;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: 38),

              Consumer(
                builder: (context, ref, _) => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _login(ref);
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
                      'Login',
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
                    'Don\'t have an account?',
                    style: theme.textTheme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: _navigateToCreateAccountScreen,
                    child: Text(
                      'Sign up',
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
    );
  }
}
