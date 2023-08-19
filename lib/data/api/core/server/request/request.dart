import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_test/core/errors/exception.dart';

/// Class for forming a request object and making requests to the server.
final class ConfigRequestServer {
  //? Access key
  // static const _apIKey = '6a22a58eaf4a4ed6b6e5e06e6addeb89';
  static const _apIKey = 'b0b6c5d2af35492ab5a95bd1e63c9561';

  // static const _apIKey = '70f78b9e19524f5aa9e2ab72f16391fb';
  // static const _apIKey = '707cad8fe9b64a37b36a526608529bf2';

  // static const _apIKey = '70f78b9e19524f5aa9e2ab72f16391fb';


  // Makes a request to the server.
  static Future<Map<String, dynamic>?> request(Client api, {required String query}) async {
    final request = Uri.parse(_formDataObject(query));
    final response = await api.get(request);
    _checkResponse(response);
    return jsonDecode(response.body);
  }

  // Forming a data object for a request.
  static String _formDataObject(String query) {
    final request = 'https://newsapi.org/v2/$query&apiKey=$_apIKey';
    print("REQUEST API: $request");
    return request;
  }

  // Checking Server Response Codes.
  static void _checkResponse(Response response) {
    if (response.statusCode != 200) throw ApiException("Error server api: ${response.statusCode}");
  }
}
