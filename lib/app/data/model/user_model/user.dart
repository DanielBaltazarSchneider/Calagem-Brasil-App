// class AppUser {
//   String? uuidUsuario;
//   String? email;
//
//   AppUser({this.uuidUsuario, this.email});
//
//   AppUser.fromJson(Map<String, dynamic> json) {
//     uuidUsuario = json['uid'];
//     email = json['email'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['uid'] = this.uuidUsuario;
//     data['email'] = this.email;
//     return data;
//   }
// }

import 'dart:convert';

User userFroMap(Map<String, dynamic> mapUser) => User.fromMap(mapUser);

String userToJson(User data) => json.encode(data.toMap());

class User {
  User({
    required this.id,
    required this.uuidUsuario,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.tipoProfissional,
    required this.registroConselho,
  });

  final String id;
  final String uuidUsuario;
  final String nome;
  final String email;
  final String telefone;
  final String tipoProfissional;
  final String registroConselho;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        uuidUsuario: json["uuid_usuario"],
        nome: json["nome"],
        email: json["email"],
        telefone: json["telefone"],
        tipoProfissional: json["tipo_profissional"],
        registroConselho: json["registro_conselho"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uuid_usuario": uuidUsuario,
        "nome": nome,
        "email": email,
        "telefone": telefone,
        "tipo_profissional": tipoProfissional,
        "registro_conselho": registroConselho,
      };
}
