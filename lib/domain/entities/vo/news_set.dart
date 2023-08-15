import 'package:news_test/domain/entities/vo/news.dart';

final class NewsSet {
  final List<NewsEntity>? listFeaturedNews;
  final List<NewsEntity>? listLatestdNews;

  NewsSet({required this.listFeaturedNews, required this.listLatestdNews});
  NewsSet.empty()
      : listFeaturedNews = [],
        listLatestdNews = [];
}
