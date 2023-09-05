import 'dart:convert';

import 'package:ifmaker_app/src/data/model/login_model.dart';
import 'package:ifmaker_app/src/data/model/payload_model.dart';
import 'package:http/http.dart' as http;

Future<JwtPayload> login(LoginModel log) async {
  const url = 'https://ifmaker-api.vercel.app/sessao';

  final response = await http.post(Uri.parse(url),
      headers: {'Content-Type': 'application/json'}, body: jsonEncode(log));

  if (response.statusCode == 200) {
    return JwtPayload.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}
