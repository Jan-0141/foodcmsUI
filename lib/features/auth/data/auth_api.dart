// lib/features/auth/data/auth_api.dart
import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthResult {
  final String token;

  AuthResult({required this.token});

  factory AuthResult.fromJson(Map<String, dynamic> json) {
    return AuthResult(token: json['token'] as String);
  }
}

class AuthApi {
  final String baseUrl = 'http://localhost:5031'; // หรือ URL ของ .NET API

  Future<AuthResult> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/api/auth/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return AuthResult.fromJson(json);
    } else {
      throw Exception('Login failed: ${response.statusCode} ${response.body}');
    }
  }
}
