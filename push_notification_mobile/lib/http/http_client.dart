import 'dart:convert';
import 'package:http/http.dart' as http;

class THttpHelper {
  static const String _baseUrl =
      'https://printavenue.ph/mysqli_api'; // Replace with your API base URL

  // Helper method to make a GET request
  static Future<List<dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Helper method to make a POST request
  static Future<List<dynamic>> post(
      String endpoint, dynamic data, bool toDecode, bool returnBody) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      body: toDecode ? jsonDecode(data) : data,
    );

    return returnBody ? _handleResponse(response) : [];
  }

  // Handle the HTTP response
  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      if (response.body == '1') {
        return [];
      } else {
        return json.decode(response.body);
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
