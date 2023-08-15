import 'package:news_test/data/api/interfaces/api.dart';
import 'package:news_test/data/models/news.dart';

/// Description ApiServer
class ApiServer implements ApiEnvelope {
  /// Description getNews
  @override
  Future<List<NewsModel>?> getNews(int offset) async {
    // TODO: implement getNews
    throw UnimplementedError();
  }
}
