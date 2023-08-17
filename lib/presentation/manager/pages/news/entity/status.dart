part of '../provider.dart';

/// Statuses of the list of news that are involved in updating the interface.
final class _StatusData {
  var statusSetViewed = ActionStatus.isDone;
  var statusFeaturedNews = StatusContent.isLoadContent;
  var statusLatestNews = StatusContent.isLoadContent;

  void setAll(StatusContent val) => statusLatestNews = statusFeaturedNews = val;

  void setFeatured(StatusContent val) => statusFeaturedNews = val;
  void setLatest(StatusContent val) => statusLatestNews = val;

  bool get isEmptyFeature => statusFeaturedNews == StatusContent.isEmptyContent;
  bool get isEmptyLatest => statusLatestNews == StatusContent.isEmptyContent;
}
