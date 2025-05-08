class AuthOutput {
  final String username;
  final String password;

  AuthOutput({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }
}
