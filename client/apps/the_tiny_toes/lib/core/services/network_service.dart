import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse('$_baseUrl$endpoint'),
      headers: headers ?? {'User-Agent': 'FlutterApp'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data (Status: ${response.statusCode})');
    }
  }
}
