class UserAccount {
  final String id;
  final String username;
  final String email;
  final String? avatarPath;

  const UserAccount({
    required this.id,
    required this.username,
    required this.email,
    this.avatarPath,
  });
}
