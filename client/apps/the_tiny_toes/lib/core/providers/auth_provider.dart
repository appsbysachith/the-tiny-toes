import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class AuthProvider with ChangeNotifier {
  final String _hardcodedUsername = "admin";
  final String _hardcodedPassword = "1234";

  String? _loggedInUser;
  final StorageService _storage = StorageService();

  String? get loggedInUser => _loggedInUser;

  Future<bool> login(String username, String password) async {
    if (username == _hardcodedUsername && password == _hardcodedPassword) {
      _loggedInUser = username;
      await _storage.saveUsername(username);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<void> loadLoggedInUser() async {
    final savedUser = await _storage.getUsername();
    if (savedUser != null) {
      _loggedInUser = savedUser;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _loggedInUser = null;
    await _storage.clearUsername();
    notifyListeners();
  }

  bool get isLoggedIn => _loggedInUser != null;
}
