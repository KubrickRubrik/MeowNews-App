import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/interfaces/server_dto.dart';
import 'package:news_test/domain/entities/vo/news.dart';
import 'package:news_test/domain/entities/vo/news_set.dart';

/// Description of NewsRepository.
abstract interface class NewsRepository {
  /// Description of getNews
  Future<({NewsSet? data, Failure? fail})> getNews({required ServerDTO featuredNews, required ServerDTO latestNews});

  /// Description of getMoreNews
  Future<({List<NewsEntity>? data, Failure? fail})> getMoreNews(ServerDTO dto);

  /// Description of setViewedNews
  Future<({List<String>? data, Failure? fail})> setViewedNews(ServerDTO dto);
}
