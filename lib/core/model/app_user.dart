class AppUser {
  final int id;
  final String username;
  final String email;
  final String role;
  final String? name;

  AppUser({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    this.name,
  });

  // Convert JSON to Dart object
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      role: json['role'],
      name: json['name'],
    );
  }

  // Convert Dart object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'role': role,
      'name': name,
    };
  }
}
