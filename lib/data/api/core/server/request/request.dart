import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:news_test/core/errors/exception.dart';
import 'package:news_test/data/models/dto/dto.dart';

/// Class for forming a request object and making requests to the server.
final class ConfigRequestServer {
  // Makes a request to the server.
  static Future<Map<String, dynamic>?> request() async {
    //  final response = await apiServer.post(
    //   ConfigActionsApi.linkServer,
    //   options: Options(headers: {'Accept': 'application/json'}),
    //   data: _formDataObject(dto, serverData),
    // );
    final response = Response(_DataNews.response, 200);
    _checkResponse(response);
    return jsonDecode(response.body);
  }

// Forming a data object for a request.
  static String _formDataObject(Dto dto) {
    return jsonEncode({
      ...dto.toMapRequest(),
      'timezoneOffset': DateTime.now().timeZoneOffset.inSeconds,
    });
  }

  // Checking Server Response Codes.
  static void _checkResponse(Response response) {
    if (response.statusCode != 200) throw ApiException("${response.statusCode}");
  }
}

final class _DataNews {
  static String get response => jsonEncode(listNews);

  static final listNews = [
    {
      "idNews": 1,
      "mainBanner": "1.jpg",
      "additionBanner": [],
      "titleNews": "Incredible Graphics about ABSTRACT",
      "descriptionNews": """
          As a product manager, you’re busy dreaming up strategies, functions, and features for your company’s latest products. That’s a lot of responsibility, especially when you’re in charge of dozens of product lines.

          But your work isn’t over once a product goes live. Now you need to compose the perfect product description that will show up well in search engines and sway shoppers’ purchase decisions."""
    },
  ];
}
