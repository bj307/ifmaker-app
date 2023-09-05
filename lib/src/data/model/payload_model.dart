import 'dart:convert';

JwtPayload jwtPayloadFromJson(String str) =>
    JwtPayload.fromJson(json.decode(str));

String jwtPayloadToJson(JwtPayload data) => json.encode(data.toJson());

class JwtPayload {
  String id;
  String nome;
  String jwtToken;
  String email;

  JwtPayload({
    required this.id,
    required this.nome,
    required this.jwtToken,
    required this.email,
  });

  factory JwtPayload.fromJson(Map<String, dynamic> json) => JwtPayload(
        id: json["id"],
        nome: json["nome"],
        jwtToken: json["jwtToken"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "jwtToken": jwtToken,
        "email": email,
      };
}
