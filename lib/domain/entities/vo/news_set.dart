import 'package:news_test/domain/entities/vo/news.dart';

final class NewsSet {
  final List<NewsEntity> listFeaturedNews;
  final List<NewsEntity> listLatestdNews;

  NewsSet({required List<NewsEntity>? featuredNews, required List<NewsEntity>? latestdNews})
      : listFeaturedNews = featuredNews ?? [],
        listLatestdNews = latestdNews ?? [];

  NewsSet.empty()
      : listFeaturedNews = [],
        listLatestdNews = [];
}
