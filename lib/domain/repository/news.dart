import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/news.dart';

/// Description of NewsRepository
abstract interface class NewsRepository {
  /// Description of getNews
  Future<({Failure? fail, List<NewsEntity>? data})> getNews(int offset);
}
