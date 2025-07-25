import 'package:flutter/material.dart';
import 'package:the_tiny_toes/core/services/network_service.dart';

enum UsersState { initial, loading, success, error }

class UsersProvider with ChangeNotifier {
  final NetworkService _networkService = NetworkService();

  List<dynamic> _users = [];
  UsersState _state = UsersState.initial;
  String? _errorMessage;

  List<dynamic> get users => _users;
  UsersState get state => _state;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUsers() async {
    _state = UsersState.loading;
    notifyListeners();

    try {
      final data = await _networkService.get('/users');
      _users = data;
      _state = UsersState.success;
    } catch (e) {
      _errorMessage = e.toString();
      _state = UsersState.error;
    }

    notifyListeners();
  }
}
