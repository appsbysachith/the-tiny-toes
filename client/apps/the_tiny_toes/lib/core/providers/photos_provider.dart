import 'package:flutter/material.dart';
import 'package:the_tiny_toes/core/services/network_service.dart';

enum PhotosState { initial, loading, success, error }

class PhotosProvider with ChangeNotifier {
  final NetworkService _networkService = NetworkService();

  List<dynamic> _photos = [];
  PhotosState _state = PhotosState.initial;
  String? _errorMessage;

  List<dynamic> get photos => _photos;
  PhotosState get state => _state;
  String? get errorMessage => _errorMessage;

  Future<void> fetchPhotos(int albumId) async {
    _state = PhotosState.loading;
    notifyListeners();

    try {
      final data = await _networkService.get('/photos?albumId=$albumId');
      _photos = data;
      _state = PhotosState.success;
    } catch (e) {
      _errorMessage = e.toString();
      _state = PhotosState.error;
    }

    notifyListeners();
  }
}
