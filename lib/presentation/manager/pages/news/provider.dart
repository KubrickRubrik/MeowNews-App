import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/data/models/dto/dto.dart';
import 'package:news_test/domain/entities/dto/item_news.dart';
import 'package:news_test/domain/entities/dto/news.dart';
import 'package:news_test/domain/entities/dto/viewed.dart';
import 'package:news_test/domain/entities/vo/news.dart';
import 'package:news_test/domain/entities/vo/news_set.dart';
import 'package:news_test/domain/use_cases/news.dart';
import 'package:collection/collection.dart';
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
    final featuredNewsDTO = NewsDTO(
      1,
      target: TargetNews.featured,
      country: AvailableCountryNews.ru,
      language: AvailableLanguageNews.ru,
      pageSize: pageData.featuredNewsCount,
    );
    final latestNewsDTO = NewsDTO(
      1,
      target: TargetNews.latest,
      pageSize: pageData.latestNewsCount,
    );
    //? Request.
    status.setAll(StatusContent.isLoadContent);
    notifyListeners(); // to display the loading screen
    final response = await _newsCase.getInitNews(featuredNews: featuredNewsDTO, latestNews: latestNewsDTO);
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
    if (super.actionStatusFeaturedContent == ActionStatus.isAction || status.isEmptyFeature) return;
    _setActionsFeatured(ActionStatus.isAction);
    //? Formation of request parameters.
    final dto = NewsDTO(
      pageData.getItemPage(TargetNews.featured),
      target: TargetNews.featured,
      country: AvailableCountryNews.ru,
      language: AvailableLanguageNews.ru,
      pageSize: pageData.featuredNewsCount,
    );
    //? Request.
    status.setFeatured(StatusContent.isLoadContent);
    notifyListeners(); // to display the loading screen
    final response = await _newsCase.getMoreNews(dto);
    _setActionsFeatured(ActionStatus.isDone);
    //? Checking for failure.
    if (_isFail(response.fail)) {
      status.setFeatured(StatusContent.isEmptyContent);
      notifyListeners();
    }
    //? Data verification.
    if (response.data == null || response.data!.isEmpty) {
      status.setFeatured(StatusContent.isEmptyContent);
      notifyListeners();
    }
    //? Adding new data.
    pageData.overwritingPageData(NewsSet(
      featuredNews: response.data,
      latestdNews: null,
    ));
    status.setFeatured(StatusContent.isViewContent);
    notifyListeners();
  }

  /// Getting the latest news on scroll
  Future<void> getLatestNews() async {
    if (super.actionStatusLatestNews == ActionStatus.isAction || status.isEmptyLatest) return;
    _setActionsLatest(ActionStatus.isAction);
    //? Formation of request parameters.
    final dto = NewsDTO(
      pageData.getItemPage(TargetNews.latest),
      target: TargetNews.latest,
      pageSize: pageData.latestNewsCount,
    );
    //? Request.
    status.setFeatured(StatusContent.isLoadContent);
    notifyListeners(); // to display the loading screen
    final response = await _newsCase.getMoreNews(dto);
    _setActionsFeatured(ActionStatus.isDone);
    //? Checking for failure.
    if (_isFail(response.fail)) {
      status.setFeatured(StatusContent.isEmptyContent);
      notifyListeners();
    }
    //? Data verification.
    if (response.data == null || response.data!.isEmpty) {
      status.setFeatured(StatusContent.isEmptyContent);
    }
    //? Adding new data.
    pageData.overwritingPageData(NewsSet(
      featuredNews: null,
      latestdNews: response.data,
    ));
    status.setLatest(StatusContent.isViewContent);
    notifyListeners();
  }

  /// Marking all downloaded news as `viewed`
  Future<void> setAllNewsViewed() async {
    if (super.actionStatus == ActionStatus.isAction) return;
    _setActionSetViewed(ActionStatus.isAction);
    //? Formation of request parameters.
    final list = pageData.getAllIdNews();
    if (list.isEmpty) {
      _setActionSetViewed(ActionStatus.isDone);
      return;
    }
    final dto = ViewedNewsDTO(list);
    //? Request.
    _setActionSetViewed(ActionStatus.isAction);
    final response = await _newsCase.setViewedNews(dto);
    _setActionSetViewed(ActionStatus.isDone);
    //? Checking for failure.
    if (_isFail(response.fail)) return;
    //? Data verification.
    if (response.data == null || response.data!.isEmpty) return;
    //? Adding new data.
    pageData.setAllNewsViewedStatus(response.data!);
    notifyListeners();
  }

  /// Loading news data and setting the mark `viewed`
  Future<bool> getDetailNews(int item) async {
    return true;
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

  /// Setting the status of the news status setting button `viewed`
  void _setActionSetViewed(ActionStatus val) {
    status.statusSetViewed = val;
    notifyListeners();
  }
}
