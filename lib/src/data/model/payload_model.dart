class PayloadModel {
  final String id;
  final String nome;
  final String jwtToken;
  final String email;

  PayloadModel({required this.id, required this.nome, required this.jwtToken, required this.email});

  factory PayloadModel.fromMap(Map<String, dynamic> map) {
    return PayloadModel(id: map['id'], nome: map['nome'], jwtToken: map['jwtToken'], email: map['email']);
  }
}