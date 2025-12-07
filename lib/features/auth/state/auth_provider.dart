// lib/features/auth/state/auth_provider.dart
import 'package:flutter/material.dart';
import '../data/auth_api.dart';

class AuthProvider extends ChangeNotifier {
  final AuthApi _api;

  AuthProvider(this._api);

  bool isLoading = false;
  String? token;
  String? errorMessage;

  Future<void> login(String username, String password) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _api.login(username, password);
      token = result.token; // สมมติ response มี field token
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool get isLoggedIn => token != null;
}
