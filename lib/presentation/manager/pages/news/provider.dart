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
    //? Launchability check
    if (super.actionStatus == ActionStatus.isAction) return;
    _setActionsPage(ActionStatus.isAction);
    status.reset();
    //? Formation of request parameters.
    final featuredNewsDTO = NewsDTO(
      1,
      target: TargetNews.featured,
      country: AvailableCountryNews.us,
      language: AvailableLanguageNews.en,
      pageSize: pageData.featuredNewsCount,
    );
    final latestNewsDTO = NewsDTO(
      1,
      target: TargetNews.latest,
      pageSize: pageData.latestNewsCount,
    );
    //? Request.
    status._setAll(StatusSection.isLoadContent);
    notifyListeners(); // to display the loading screen
    final response = await _newsCase.getInitNews(featuredNews: featuredNewsDTO, latestNews: latestNewsDTO);
    _setActionsPage(ActionStatus.isDone);
    //? Checking for failure.
    if (_isFail(response.fail)) {
      status._setAll(StatusSection.isNoContent);
      return;
    }
    //? Data verification.
    if (!_isCorrectData(response.data)) return;
    //? Adding new data.
    pageData._overwritingPageData(response.data!);
    _setDisplayingDownloadedData();
  }

  /// Getting featured news on scroll
  Future<void> getFeaturedNews() async {
    //? Launchability check
    if (status.featured.statusScroll != StatusContent.isViewContent) return;
    status.featured._setScroll(StatusContent.isLoadContent);
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 500));
    //? Formation of request parameters.
    final dto = NewsDTO(
      pageData.getItemPage(TargetNews.featured),
      target: TargetNews.featured,
      country: AvailableCountryNews.us,
      language: AvailableLanguageNews.en,
      pageSize: pageData.featuredNewsCount,
    );
    //? Request.
    final response = await _newsCase.getMoreNews(dto);
    //? Checking for failure.
    if (_isFail(response.fail)) {
      status.featured._setScroll(StatusContent.isEmptyContent);
      notifyListeners();
      return;
    }
    //? Data verification.
    if (response.data == null || response.data!.isEmpty) {
      status.featured._setScroll(StatusContent.isEmptyContent);
      notifyListeners();
      return;
    }
    //? Adding new data.
    pageData._addingNewData(NewsSet(
      featuredNews: response.data,
      latestdNews: null,
    ));
    status.featured._setScroll(StatusContent.isViewContent);
    notifyListeners();
  }

  /// Getting the latest news on scroll
  Future<void> getLatestNews() async {
    //? Launchability check
    if (status.latest.statusScroll != StatusContent.isViewContent) return;
    status.latest._setScroll(StatusContent.isLoadContent);
    notifyListeners();
    //? Formation of request parameters.
    final dto = NewsDTO(
      pageData.getItemPage(TargetNews.latest),
      target: TargetNews.latest,
      pageSize: pageData.latestNewsCount,
    );
    //? Request.
    notifyListeners(); // to display the loading screen
    final response = await _newsCase.getMoreNews(dto);
    //? Checking for failure.
    if (_isFail(response.fail)) {
      status.latest._setScroll(StatusContent.isEmptyContent);
      notifyListeners();
      return;
    }
    //? Data verification.
    if (response.data == null || response.data!.isEmpty) {
      status.latest._setScroll(StatusContent.isEmptyContent);
      notifyListeners();
      return;
    }
    //? Adding new data.
    pageData._addingNewData(NewsSet(
      featuredNews: null,
      latestdNews: response.data,
    ));

    status.latest._setScroll(StatusContent.isViewContent);
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

  /// Setting the data display status for the `featured` and `latest` list news
  void _setDisplayingDownloadedData() {
    if (pageData.newSet.listFeaturedNews.isNotEmpty) {
      status.featured._setSection(StatusSection.isViewContent);
    } else {
      status.featured._setSection(StatusSection.isNoContent);
    }
    if (pageData.newSet.listLatestdNews.isNotEmpty) {
      status.latest._setSection(StatusSection.isViewContent);
    } else {
      status.latest._setSection(StatusSection.isNoContent);
    }
    notifyListeners();
  }

  /// Checking for correct data
  /// The featured and latest news lists have their own statuses.
  /// The statuses are different for the state when the content has
  /// already been loaded or is being loaded for the first time.
  bool _isCorrectData(NewsSet? data) {
    if (data != null) return true;
    status._setAll(StatusSection.isNoContent);
    // if (pageData.newSet.listFeaturedNews.isEmpty && pageData.newSet.listLatestdNews.isEmpty) {
    //   // Used if the data could not be loaded at all.

    // } else {
    //   //? Checking previously uploaded data for featured news
    //   if (pageData.newSet.listFeaturedNews.isEmpty) {
    //     status.setFeatured(StatusContent.isNoContent);
    //   } else {
    //     status.setFeatured(StatusContent.isEmptyContent);
    //   }
    //   //? Checking previously uploaded data for latest news
    //   if (pageData.newSet.listLatestdNews.isEmpty) {
    //     status.setLatest(StatusContent.isNoContent);
    //   } else {
    //     status.setLatest(StatusContent.isEmptyContent);
    //   }
    // }
    notifyListeners();
    return false;
  }

  /// Setting the status of the news status setting button `viewed`
  void _setActionSetViewed(ActionStatus val) {
    status.statusSetViewed = val;
    notifyListeners();
  }
}
