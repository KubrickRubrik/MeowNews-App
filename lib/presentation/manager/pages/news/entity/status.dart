part of '../provider.dart';

/// Statuses of the list of news that are involved in updating the interface.
final class _StatusData {
  var statusFeaturedNews = StatusContent.isLoadContent;
  var statusLatestNews = StatusContent.isLoadContent;

  void setAll(StatusContent val) => statusLatestNews = statusFeaturedNews = val;

  void setDifferent({StatusContent? featured, StatusContent? latest}) {
    if (featured != null) statusFeaturedNews = featured;
    if (latest != null) statusLatestNews = latest;
  }

  void setFeatured(StatusContent val) => statusFeaturedNews = val;
  void setLatest(StatusContent val) => statusLatestNews = val;
}
