class User {
  const User({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.role,
    required this.emailVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final String role;
  final bool emailVerified;
  final String createdAt;
  final String updatedAt;
}
