import 'package:news_test/data/models/dto/dto.dart';
import 'package:news_test/data/models/news.dart';

/// Description of ApiEnvelope.
abstract interface class ApiEnvelope {
  /// Description of getNews.
  Future<List<NewsModel>?> getInitNews({required Dto featuredNews, required Dto latestNews});
}
