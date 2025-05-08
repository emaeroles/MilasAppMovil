class GetUserInput {
  final String id;
  final String username;
  final String email;

  GetUserInput({required this.id, required this.username, required this.email});

  factory GetUserInput.fromJson(Map<String, dynamic> json) {
    return GetUserInput(
      id: json["id"],
      username: json["username"],
      email: json["email"],
    );
  }
}
