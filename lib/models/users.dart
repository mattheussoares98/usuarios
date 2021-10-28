class User {
  final String? id;
  final String? urlAvatar;
  final String name;
  final String email;

  User({
    this.id,
    required this.name,
    required this.email,
    this.urlAvatar = '',
  });
}
