import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/interfaces/dto.dart';
import 'package:news_test/domain/entities/dto/item_news.dart';
import 'package:news_test/domain/entities/dto/news.dart';
import 'package:news_test/domain/entities/dto/viewed.dart';
import 'package:news_test/domain/entities/vo/item_news.dart';
import 'package:news_test/domain/entities/vo/news.dart';
import 'package:news_test/domain/entities/vo/news_set.dart';
import 'package:news_test/domain/use_cases/item_news.dart';
import 'package:news_test/domain/use_cases/news.dart';
import 'package:collection/collection.dart';
part 'state.dart';
part 'entity/page_data.dart';
part 'entity/news_bar.dart';
part 'entity/status.dart';

final class NewsProvider extends ChangeNotifier with _State {
  NewsProvider(this._newsCase, this._itemNewsCase);
  final NewsCase _newsCase;
  final ItemNewsCase _itemNewsCase;

  /// Getting featured and latest news.
  Future<void> getInitNews() async {
    //? Launchability check
    if (actionStatus == ActionStatus.isAction) return;
    _setActionsPage(ActionStatus.isAction);
    status.reset();
    pageData.newsSearchBar._setStatusOpen(null);
    //? Formation of request parameters.
    final options = pageData.newsSearchBar.options;
    // 1. For featured news, the parameters are assigned independently
    //    so that they differ from the latest news.
    final featuredNewsDTO = NewsDTO(
      1,
      target: TargetNews.featured,
      searchWord: 'IT',
      language: AvailableNewsLanguages.ru,
      sort: AvailableNewsSorting.popularity,
      pageSize: options._featuredNewsCount,
    );
    // 2. For the latest news, the parameters are assigned by the
    //    user from the [newsBar] object. These parameters can be changed
    //    by the user when performing a search in the NewsBar.
    final latestNewsDTO = NewsDTO(
      1,
      target: TargetNews.latest,
      searchWord: options.getSearchWord,
      language: options.languageOptions,
      sort: options.sortOptions,
      pageSize: options._latestNewsCount,
    );
    //? Request.
    status._setAll(StatusSection.isLoadContent);
    notifyListeners(); // to display the loading screen.
    final response = await _newsCase.getInitNews(featuredNews: featuredNewsDTO, latestNews: latestNewsDTO);
    _setActionsPage(ActionStatus.isDone);
    //? Checking for failure.
    if (_isFail(response.fail)) {
      status._setAll(StatusSection.isNoContent);
      notifyListeners();
      return;
    }
    //? Data verification.
    if (!_isCorrectData(response.data)) {
      notifyListeners();
      return;
    }
    //? Adding new data.
    pageData._overwritingPageData(response.data!);
    _setDisplayingDownloadedData();
  }

  /// Getting featured news on scroll.
  Future<void> getFeaturedNews() async {
    //? Launchability check
    if (status.featured.statusScroll != StatusContent.isViewContent) return;
    status.featured._setScroll(StatusContent.isLoadContent);
    notifyListeners();
    //? Formation of request parameters.
    final options = pageData.newsSearchBar.options;
    final dto = NewsDTO(
      pageData.getPageNumber(TargetNews.featured),
      target: TargetNews.featured,
      searchWord: 'IT',
      language: AvailableNewsLanguages.ru,
      sort: AvailableNewsSorting.popularity,
      pageSize: options._featuredNewsCount,
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
    status.statusSetViewedButton = StatusViewed.isNotViewed;
    status.featured._setScroll(StatusContent.isViewContent);
    notifyListeners();
  }

  /// Getting the latest news on scroll.
  Future<void> getLatestNews() async {
    //? Launchability check
    if (status.latest.statusScroll != StatusContent.isViewContent) return;
    status.latest._setScroll(StatusContent.isLoadContent);
    notifyListeners();
    //? Formation of request parameters.
    final options = pageData.newsSearchBar.options;
    final dto = NewsDTO(
      pageData.getPageNumber(TargetNews.latest),
      target: TargetNews.latest,
      searchWord: options.getSearchWord,
      language: options.languageOptions,
      sort: options.sortOptions,
      pageSize: options._latestNewsCount,
    );
    //? Request.
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
    status.statusSetViewedButton = StatusViewed.isNotViewed;
    status.latest._setScroll(StatusContent.isViewContent);
    notifyListeners();
  }

  /// Search new latest news.
  Future<void> searchLatestNews() async {
    //? Launchability check
    if (status.latest.statusSection == StatusSection.isLoadContent) return;
    pageData.newsSearchBar._setStatusOpen(null);
    status.latest.reset();
    notifyListeners();
    //? Formation of request parameters.
    final options = pageData.newsSearchBar.options;
    final dto = NewsDTO(
      1,
      target: TargetNews.latest,
      searchWord: options.getSearchWord,
      language: options.languageOptions,
      sort: options.sortOptions,
      pageSize: options._latestNewsCount,
    );
    //? Request.
    final response = await _newsCase.getMoreNews(dto);
    //? Checking for failure.
    if (_isFail(response.fail)) {
      status.latest._setSection(StatusSection.isNoContent);
      notifyListeners();
      return;
    }
    //? Data verification.
    if (response.data == null || response.data!.isEmpty) {
      status.latest._setSection(StatusSection.isNoContent);
      notifyListeners();
      return;
    }
    //? Adding new data.
    pageData.newSet.listLatestdNews.clear();
    pageData._addingNewData(NewsSet(
      featuredNews: null,
      latestdNews: response.data,
    ));
    status.statusSetViewedButton = StatusViewed.isNotViewed;
    status.latest._setSection(StatusSection.isViewContent);
    notifyListeners();
  }

  // Loading news data and setting the mark `viewed`
  // Since the news resource does not allow to
  // request news by ID, a little trick will be used in [ItemNewsCase].
  Future<ItemNewsEntity?> getItemNewsDetail(TargetNews target, {required String idNews, required int index}) async {
    if (status.statusPreload != ActionStatus.isDone) return null;
    _setActionPreloadNews(ActionStatus.isAction);
    //? Formation of request parameters.
    final newstDTO = ItemNewsDTO(index, idSource: idNews, target: target);
    //? Request
    final response = await _itemNewsCase.getItemNews(newstDTO);
    _setActionPreloadNews(ActionStatus.isDone);
    //? Checking for failure.
    if (_isFail(response.fail) || response.data == null) return null;
    //? Response
    return response.data!;
  }

  /// Marking all downloaded news as `viewed`.
  Future<bool?> setAllNewsViewed() async {
    if (status.statusSetViewedButton == StatusViewed.isLoadContent) return null;
    _setActionSetViewed(StatusViewed.isLoadContent);
    //? Formation of request parameters.
    final list = pageData.getAllIdNews();
    if (list.isEmpty) {
      _setActionSetViewed(StatusViewed.isNotViewed);
      return null;
    }
    final dto = ViewedNewsDTO(list);
    //? Request.
    final response = await _newsCase.setViewedNews(dto);

    //? Checking for failure.
    if (_isFail(response.fail)) {
      _setActionSetViewed(StatusViewed.isNotViewed);
      return false;
    }
    //? Data verification.
    if (response.data == null || response.data!.isEmpty) {
      _setActionSetViewed(StatusViewed.isNotViewed);
      return false;
    }
    //? Setting the status viewed.
    setNewsViewedStatus(response.data!);
    _setActionSetViewed(StatusViewed.isViewed);
    return true;
  }

  /// Setting the data display status for the `featured` and `latest` list news.
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

  /// Setting the "viewed" status for one or more news items.
  void setNewsViewedStatus(List<String> listIDNews) {
    pageData._setAllNewsViewedStatus(listIDNews);
  }

  /// Checking for correct data
  /// The featured and latest news lists have their own statuses content
  /// so use used `status._setAll` to cover all statuses at once.
  bool _isCorrectData(NewsSet? data) {
    if (data != null) return true;
    status._setAll(StatusSection.isNoContent);
    return false;
  }

  /// Setting the status of the news status setting button `viewed`.
  void _setActionSetViewed(StatusViewed val) {
    status.statusSetViewedButton = val;
    notifyListeners();
  }

  /// Setting the status of ItemNews.
  void _setActionPreloadNews(ActionStatus val) {
    status.statusPreload = val;
    notifyListeners();
  }

  /// Hide/show search options settings.
  void setDisplayNewsBar([TargetSettingsNewsBar? val]) {
    pageData.newsSearchBar._setStatusOpen(val);
    notifyListeners();
  }

  /// Setting the news search language.
  void setLanguageOptions(AvailableNewsLanguages val) {
    pageData.newsSearchBar._setStatusOpen(null);
    pageData.newsSearchBar.setLanguageOptions(val);
    notifyListeners();
  }

  /// Setting the type of news search sorting.
  void setSortOptions(AvailableNewsSorting val) {
    pageData.newsSearchBar._setStatusOpen(null);
    pageData.newsSearchBar.setSortOptions(val);
    notifyListeners();
  }
}
