import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final String _hardcodedUsername = "admin";
  final String _hardcodedPassword = "1234";

  String? _loggedInUser;

  String? get loggedInUser => _loggedInUser;

  bool login(String username, String password) {
    if (username == _hardcodedUsername && password == _hardcodedPassword) {
      _loggedInUser = username;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void logout() {
    _loggedInUser = null;
    notifyListeners();
  }

  bool get isLoggedIn => _loggedInUser != null;
}
