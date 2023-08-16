import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/data/models/dto/dto.dart';
import 'package:news_test/domain/entities/vo/news_set.dart';

/// Description of NewsRepository.
abstract interface class NewsRepository {
  /// Description of getNews
  Future<({NewsSet? data, Failure? fail})> getInitNews({required Dto featuredNews, required Dto latestNews});
}
