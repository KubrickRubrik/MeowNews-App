part of '../provider.dart';

/// Statuses of the list of news that are involved in updating the interface.
/// Used for similar statuses (`statusSection` & `statusScroll`).
///
/// This is necessary because `statusSection` statuses are responsible
/// for the loading status of the entire news section.
///
/// `statusScroll` status responses are used when loading content after scrolling.
///
final class _StatusData {
  // Button status in AppBar (set `viewed` for news)
  var statusSetViewed = ActionStatus.isDone;
  // News `ALL` section download statuses
  final featured = _StatusSection();
  final latest = _StatusSection();

  void _setAll(StatusSection val) {
    featured.statusSection = val;
    latest.statusSection = val;
  }

  //
  void reset() {
    featured.reset();
    latest.reset();
  }
}

final class _StatusSection {
  var statusSection = StatusSection.isLoadContent;
  var statusScroll = StatusContent.isViewContent;

  void _setSection(StatusSection val) => statusSection = val;
  void _setScroll(StatusContent val) => statusScroll = val;

  void reset() {
    statusSection = StatusSection.isLoadContent;
    statusScroll = StatusContent.isViewContent;
  }
}
