part of '../provider.dart';

final class _PageData {
  final newSete = NewsSet.empty();
  final listNews = <NewsEntity>[];

  // Overwriting the used idSeries and clean for new data
  void overwritingPageData(NewsSet data) {
    if (data.listFeaturedNews != null) newSete.listFeaturedNews?.addAll(data.listFeaturedNews!);
    if (data.listLatestdNews != null) newSete.listLatestdNews?.addAll(data.listLatestdNews!);
  }
}
