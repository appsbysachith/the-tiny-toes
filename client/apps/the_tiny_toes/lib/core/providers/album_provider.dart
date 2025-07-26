import 'package:flutter/material.dart';
import 'package:the_tiny_toes/core/services/network_service.dart';

enum AlbumsState { initial, loading, success, error }

class AlbumsProvider with ChangeNotifier {
  final NetworkService _networkService = NetworkService();

  List<dynamic> _albums = [];
  AlbumsState _state = AlbumsState.initial;
  String? _errorMessage;

  List<dynamic> get albums => _albums;
  AlbumsState get state => _state;
  String? get errorMessage => _errorMessage;

  Future<void> fetchAlbums(int userId) async {
    if (_albums.isNotEmpty) return;
    _state = AlbumsState.loading;
    notifyListeners();

    try {
      final data = await _networkService.get('/albums?userId=$userId');
      _albums = data;
      _state = AlbumsState.success;
    } catch (e) {
      _errorMessage = e.toString();
      _state = AlbumsState.error;
    }

    notifyListeners();
  }
}
