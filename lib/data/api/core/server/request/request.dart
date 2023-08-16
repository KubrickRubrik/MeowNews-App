import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_test/core/errors/exception.dart';

/// Class for forming a request object and making requests to the server.
final class ConfigRequestServer {
  // Makes a request to the server.
  static Future<Map<String, dynamic>?> request(Client api, {required String query}) async {
    final request = Uri.parse(_formDataObject(query));
    final response = await api.get(request);
    _checkResponse(response);
    return jsonDecode(response.body);
  }

  // Forming a data object for a request.
  static String _formDataObject(String query) {
    // &pageSize=2
    final request = 'https://newsapi.org/v2/$query&apiKey=b0b6c5d2af35492ab5a95bd1e63c9561';
    print("REQUEST: $request");
    return request;
  }

  // Checking Server Response Codes.
  static void _checkResponse(Response response) {
    if (response.statusCode != 200) throw ApiException("Error server api: ${response.statusCode}");
  }
}
