part of '../provider.dart';

final class _PageData {
  // Number of downloaded news in one request (for one page).
  final _featuredNewsCount = 6;
  final _latestNewsCount = 12;

  // Main data list of news
  final newSet = NewsSet.empty();
  final newBar = _NewsBar();

  // Overwriting the used idSeries and clean for new data.
  void _overwritingPageData(NewsSet data) {
    newSet.listFeaturedNews.clear();
    newSet.listLatestdNews.clear();
    if (data.listFeaturedNews.isNotEmpty) newSet.listFeaturedNews.addAll(data.listFeaturedNews);
    if (data.listLatestdNews.isNotEmpty) newSet.listLatestdNews.addAll(data.listLatestdNews);
  }

  void _addingNewData(NewsSet data) {
    if (data.listFeaturedNews.isNotEmpty) newSet.listFeaturedNews.addAll(data.listFeaturedNews);
    if (data.listLatestdNews.isNotEmpty) newSet.listLatestdNews.addAll(data.listLatestdNews);
  }

  // Getting the page number depending on the number of already loaded news.
  int getItemPage(TargetNews target) {
    int page = 0;
    ({int length, int countInPage}) data = switch (target) {
      TargetNews.featured => (length: newSet.listFeaturedNews.length, countInPage: _featuredNewsCount),
      TargetNews.latest => (length: newSet.listLatestdNews.length, countInPage: _latestNewsCount),
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

  // Selection of all IDs for all currently loaded news.
  List<String> getAllIdNews() {
    final listIDNews = <String>[];
    for (final news in [...newSet.listFeaturedNews, ...newSet.listLatestdNews]) {
      listIDNews.add(news.source.id);
    }
    return listIDNews;
  }

  // Setting for all downloaded news the status "viewed".
  void _setAllNewsViewedStatus(List<String> listIdNews) {
    for (final idSource in listIdNews) {
      final itemFeaturedNews = newSet.listFeaturedNews.firstWhereOrNull((element) => element.source.id == idSource);
      if (itemFeaturedNews != null) itemFeaturedNews.viewed = true;

      final itemLatestNews = newSet.listLatestdNews.firstWhereOrNull((element) => element.source.id == idSource);
      if (itemLatestNews != null) itemLatestNews.viewed = true;
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
