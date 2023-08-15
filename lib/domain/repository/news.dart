import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/data/models/dto/dto.dart';
import 'package:news_test/domain/entities/vo/news.dart';

/// Description of NewsRepository.
abstract interface class NewsRepository {
  /// Description of getNews
  Future<({Failure? fail, List<NewsEntity>? data})> getInitNews({required Dto featuredNews, required Dto latestNews});
}
