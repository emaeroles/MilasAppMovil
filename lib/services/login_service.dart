class LoginService {
  String? usernameValid(String? username) {
    if (username == null || username.isEmpty) {
      return "El campo no puede estar vacío.";
    } else if (username.length < 3 || username.length > 10) {
      return "Debe tener entre 3 y 10 caracteres.";
    }
    return null;
  }

  String? passwordValid(String? password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$');
    if (password == null || password.isEmpty) {
      return "El campo no puede estar vacío.";
    } else if (password.length < 8 || password.length > 16) {
      return "Debe tener entre 8 y 16 caracteres.";
    } else if (!regex.hasMatch(password)) {
      return "Debe contener al menos una letra minúscula, una letra mayúscula y un número.";
    }
    return null;
  }
}
