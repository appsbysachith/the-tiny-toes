import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$_baseUrl$endpoint');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('failed to load data (status: ${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
