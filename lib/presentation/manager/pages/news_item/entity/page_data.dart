part of '../provider.dart';

final class _PageData {
  var itemNews = ItemNewsEntity.empty();

  // Overwriting the used idSeries and clean for new data
  void overwritingPageData(ItemNewsEntity data) {
    itemNews = data;
    itemNews.isAvailable = true;
  }

  void reset() {
    itemNews = ItemNewsEntity.empty();
  }
}
