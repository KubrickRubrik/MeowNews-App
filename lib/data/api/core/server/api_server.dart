import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_test/data/api/core/server/request/request.dart';
import 'package:news_test/data/api/interfaces/api.dart';
import 'package:news_test/data/models/dto/dto.dart';
import 'package:news_test/data/models/news.dart';
import 'package:news_test/domain/entities/dto/news.dart';

/// Description ApiServer.
class ApiServer implements ApiEnvelope {
  final apiServer = http.Client();

  /// Description getNews.
  @override
  Future<List<NewsModel>?> getInitNews({required Dto featuredNews, required Dto latestNews}) async {
    final featuredQueryString = (featuredNews as NewsDTO).getDataRequest();
    final latestQueryString = (latestNews as NewsDTO).getDataRequest();
    //? Get featured news
    final resFeaturedNews = await ConfigRequestServer.request(apiServer, query: featuredQueryString);
    //? Get latest news
    final resLatestNews = await ConfigRequestServer.request(apiServer, query: latestQueryString);
    //? Data Existence Check
    if (resFeaturedNews == null && resLatestNews == null) return null;
    //? Prepare data
    return resLatestNews.values.map((value) => NewsModel(value)).toList();
  }
}
