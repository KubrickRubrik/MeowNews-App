part of '../provider.dart';

final class _PageData {
  final newSet = NewsSet.empty();

  // Overwriting the used idSeries and clean for new data
  void overwritingPageData(NewsSet data) {
    print("FEATURED: ${data.listFeaturedNews.length}");
    print("LATEST: ${data.listLatestdNews.length}");
    if (data.listFeaturedNews.isNotEmpty) newSet.listFeaturedNews.addAll(data.listFeaturedNews);
    if (data.listLatestdNews.isNotEmpty) newSet.listLatestdNews.addAll(data.listLatestdNews);
  }
}
