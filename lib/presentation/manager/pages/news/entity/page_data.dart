part of '../provider.dart';

final class _PageData {
  final listNews = <NewsEntity>[];

  // Overwriting the used idSeries and clean for new data
  void overwritingPageData(List<NewsEntity> data) {
    listNews.addAll(data);
  }
}
