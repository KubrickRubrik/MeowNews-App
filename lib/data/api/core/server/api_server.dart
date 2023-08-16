import 'package:http/http.dart' as http;
import 'package:news_test/core/errors/exception.dart';
import 'package:news_test/data/api/core/server/request/request.dart';
import 'package:news_test/data/api/interfaces/api.dart';
import 'package:news_test/data/models/dto/dto.dart';
import 'package:news_test/data/models/vo/news.dart';
import 'package:news_test/domain/entities/dto/news.dart';

/// Description ApiServer.
class ApiServer implements ApiEnvelope {
  final apiServer = http.Client();

  /// Description getNews.
  @override
  Future<({List<NewsModel>? featuredNews, List<NewsModel>? latestNews})?> getInitNews({
    required Dto featuredNews,
    required Dto latestNews,
  }) async {
    final featuredQueryString = (featuredNews as NewsDTO).getDataRequest();
    final latestQueryString = (latestNews as NewsDTO).getDataRequest();
    //? Get featured news.
    final resFeaturedNews = await ConfigRequestServer.request(apiServer, query: featuredQueryString);
    //? Get latest news.
    final resLatestNews = await ConfigRequestServer.request(apiServer, query: latestQueryString);
    //? Data existence check.
    if (resFeaturedNews == null && resLatestNews == null) return null;
    //? Check status response and prepare data news.
    final resultFeaturedNews = _prepareResponse(resFeaturedNews);
    final resultLatestNews = _prepareResponse(resLatestNews);
    //? Result.
    return (featuredNews: resultFeaturedNews, latestNews: resultLatestNews);
  }

  /// Check status response and prepare data news.
  List<NewsModel>? _prepareResponse(Map<String, dynamic>? data) {
    if (data == null) return null;
    if (data['status'] == 'error') throw ApiException("Error server api: ${data['message']}");
    final listArticles = data['articles'] as List<dynamic>;
    if (listArticles.isEmpty) return null;
    return listArticles.map((value) => NewsModel(value)).toList();
  }
}
