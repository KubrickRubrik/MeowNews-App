import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/dto/news.dart';
import 'package:news_test/domain/entities/vo/news_set.dart';
import 'package:news_test/domain/use_cases/news.dart';
part 'state.dart';
part 'entity/page_data.dart';
part 'entity/status.dart';

final class NewsProvider extends ChangeNotifier with _State {
  NewsProvider(this._newsCase);
  final NewsCase _newsCase;

  /// Getting featured and latest news
  Future<void> getInitNews() async {
    if (super.actionStatus == ActionStatus.isAction) return;
    _setActionsPage(ActionStatus.isAction);
    //? Formation of request parameters.
    final featuredNews = NewsDTO(
      1,
      target: TargetNews.featured,
      country: AvailableCountryNews.ru,
      language: AvailableLanguageNews.ru,
      pageSize: 5,
    );
    final latestNews = NewsDTO(
      1,
      target: TargetNews.latest,
      pageSize: 10,
    );
    //? Request.
    status.setAll(StatusContent.isLoadContent);
    notifyListeners();
    final response = await _newsCase.getInitNews(featuredNews: featuredNews, latestNews: latestNews);
    _setActionsPage(ActionStatus.isDone);
    //? Checking for failure.
    if (_isFail(response.fail)) return;
    //? Data verification.
    if (!_isCorrectData(response.data)) return;

    //? Adding new data.
    pageData.overwritingPageData(response.data!);
    _setDisplayingDownloadedData();
  }

  /// Getting featured news on scroll
  Future<void> getFeaturedNews() async {
    if (super.actionStatusFeaturedContent == ActionStatus.isAction) return;
    _setActionsFeatured(ActionStatus.isAction);
    //? Formation of request parameters.
    final featuredNews = NewsDTO(
      1,
      target: TargetNews.featured,
      country: AvailableCountryNews.ru,
      language: AvailableLanguageNews.ru,
      pageSize: 5,
    );
    //? Request.
    //? Checking for failure.
    //? Data verification.
    //? Adding new data.
  }

  /// Getting the latest news on scroll
  Future<void> getLatestNews() async {
    if (super.actionStatusLatestNews == ActionStatus.isAction) return;
    _setActionsLatest(ActionStatus.isAction);
    //? Formation of request parameters.
    final latestNews = NewsDTO(
      1,
      target: TargetNews.latest,
      pageSize: 10,
    );
    //? Request.
    //? Checking for failure.
    //? Data verification.
    //? Adding new data.
  }

  /// Setting the data display status for the `featured` and `latest` list news
  void _setDisplayingDownloadedData() {
    if (pageData.newSet.listFeaturedNews.isNotEmpty) {
      status.setFeatured(StatusContent.isViewContent);
    } else {
      status.setFeatured(StatusContent.isEmptyContent);
    }
    if (pageData.newSet.listLatestdNews.isNotEmpty) {
      status.setFeatured(StatusContent.isViewContent);
    } else {
      status.setFeatured(StatusContent.isEmptyContent);
    }
    notifyListeners();
  }

  /// Checking for correct data
  /// The featured and latest news lists have their own statuses.
  /// The statuses are different for the state when the content has
  /// already been loaded or is being loaded for the first time.
  bool _isCorrectData(NewsSet? data) {
    if (data != null) return true;
    if (pageData.newSet.listFeaturedNews.isEmpty && pageData.newSet.listLatestdNews.isEmpty) {
      // Used if the data could not be loaded at all.
      status.setAll(StatusContent.isNoContent);
    } else {
      //? Checking previously uploaded data for featured news
      if (pageData.newSet.listFeaturedNews.isEmpty) {
        status.setFeatured(StatusContent.isNoContent);
      } else {
        status.setFeatured(StatusContent.isEmptyContent);
      }
      //? Checking previously uploaded data for latest news
      if (pageData.newSet.listLatestdNews.isEmpty) {
        status.setLatest(StatusContent.isNoContent);
      } else {
        status.setLatest(StatusContent.isEmptyContent);
      }
    }
    notifyListeners();
    return false;
  }
}
