import 'package:news_test/data/models/news_bar.dart';
import 'package:news_test/domain/entities/interfaces/server_dto.dart';
import 'package:news_test/data/models/item_news.dart';
import 'package:news_test/data/models/news.dart';

/// Description of ApiEnvelope.
abstract interface class ServerApiRepository {
  /// Description of getNews.
  Future<({List<NewsModel>? featuredNews, List<NewsModel>? latestNews})> getNews({required ServerDTO featuredNews, required ServerDTO latestNews});

  /// Description of getMoreNews.
  Future<List<NewsModel>?> getMoreNews(ServerDTO dto);

  /// Description of setViewedNews.
  Future<List<String>?> setViewedNews(ServerDTO dto);

  /// Description of getItemNews.
  Future<ItemNewsModel?> getItemNews(ServerDTO dto);
}
