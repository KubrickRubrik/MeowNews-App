part of '../provider.dart';

final class _PageData {
  var news = ItemNewsEntity.empty();

  // Overwriting the used idSeries and clean for new data
  void overwritingPageData(ItemNewsEntity data) {
    news = data;
  }
}
