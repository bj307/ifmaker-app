class LoginModel {
  final String email;
  final String senha;

  LoginModel({
    required this.email,
    required this.senha,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'senha': senha,
    };
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      senha: json['senha'],
    );
  }
}
