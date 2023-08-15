import 'package:news_test/data/api/core/server/request/request.dart';
import 'package:news_test/data/api/interfaces/api.dart';
import 'package:news_test/data/models/news.dart';

/// Description ApiServer.
class ApiServer implements ApiEnvelope {
  /// Description getNews.
  @override
  Future<List<NewsModel>?> getNews(int offset) async {
    final response = await ConfigRequestServer.request();
    if (response == null) return null;
    return response.values.map((value) => NewsModel(value)).toList();
  }
}
