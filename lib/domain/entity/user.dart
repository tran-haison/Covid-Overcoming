class User {
  const User({
    required this.name,
    required this.gender,
    required this.avatar,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  final String name;
  final String gender;
  final String avatar;
  final String email;
  final String role;
  final String createdAt;
  final String updatedAt;
}
