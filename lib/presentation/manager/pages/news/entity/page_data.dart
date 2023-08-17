part of '../provider.dart';

final class _PageData {
  // Number of downloaded news in one request.
  final featuredNewsCount = 5;
  final latestNewsCount = 10;
  final newSet = NewsSet.empty();

  // Overwriting the used idSeries and clean for new data.
  void overwritingPageData(NewsSet data) {
    print("FEATURED: ${data.listFeaturedNews.length}");
    print("LATEST: ${data.listLatestdNews.length}");
    if (data.listFeaturedNews.isNotEmpty) newSet.listFeaturedNews.addAll(data.listFeaturedNews);
    if (data.listLatestdNews.isNotEmpty) newSet.listLatestdNews.addAll(data.listLatestdNews);
  }

  // Getting the page number depending on the number of already loaded news
  int getItemPage(TargetNews target) {
    int page = 0;
    ({int length, int countInPage}) data = switch (target) {
      TargetNews.featured => (length: newSet.listFeaturedNews.length, countInPage: featuredNewsCount),
      TargetNews.latest => (length: newSet.listLatestdNews.length, countInPage: latestNewsCount),
    };
    if (data.length % data.countInPage == 0) {
      page = (data.length ~/ data.countInPage) + 1;
    } else {
      page = data.length ~/ data.countInPage;
      if (page == 0) {
        page = 1;
      } else {
        page++;
      }
      page = page + 1;
    }
    return page;
  }

  List<String> getAllIdNews() {
    return [];
  }

  void setAllNewsViewedStatus(List<String> listIdNews) {
    for (final idSource in listIdNews) {
      final itemFeaturedNews = newSet.listFeaturedNews.firstWhereOrNull((element) => element.source.id == idSource);
      if (itemFeaturedNews != null) {
        itemFeaturedNews.viewed = true;
        return;
      }
      final itemLatestNews = newSet.listLatestdNews.firstWhereOrNull((element) => element.source.id == idSource);
      if (itemLatestNews != null) {
        itemLatestNews.viewed = true;
        return;
      }
    }
  }

  // Little trick to get news data in [ItemNewsProvider].
  NewsEntity? useLittleTrick(Dto dto) {
    (dto as ItemNewsDTO);
    try {
      return switch (dto.target) {
        TargetNews.featured => newSet.listFeaturedNews.elementAt(dto.index),
        TargetNews.latest => newSet.listLatestdNews.elementAt(dto.index),
      };
    } catch (e) {
      return null;
    }
  }
}
