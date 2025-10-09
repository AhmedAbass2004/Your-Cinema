class UserParams {
  UserParams({
    required this.email,
    required this.password,
    required this.username,
    this.avatarPath,
  });

  final String email;
  final String password;
  final String username;
  String? avatarPath;
}
