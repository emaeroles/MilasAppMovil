class AuthInput {
  final String token;

  AuthInput({required this.token});

  factory AuthInput.fromJson(Map<String, dynamic> json) {
    return AuthInput(token: json["token"]);
  }
}
