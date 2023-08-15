import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/dto/news.dart';
import 'package:news_test/domain/entities/vo/news.dart';
import 'package:news_test/domain/use_cases/news.dart';
part 'state.dart';
part 'entity/page_data.dart';

final class NewsProvider extends ChangeNotifier with _State {
  NewsProvider(this._newsCase);
  final NewsCase _newsCase;

  // Series request.
  Future<void> getAllNews() async {
    if (super.actionStatus == ActionStatus.isAction) return;
    _setActions(ActionStatus.isAction);
    final featuredNews = NewsDTO(0, target: TargetNews.featured, country: AvailableCountryNews.ru, language: AvailableLanguageNews.ru);
    final latestNews = NewsDTO(0, target: TargetNews.latest);
    //? Request.
    _setStatusPage(StatusContent.isLoadContent);
    final response = await _newsCase.getInitNews(featuredNews: featuredNews, latestNews: latestNews);
    _setActions(ActionStatus.isDone);
    //? Checking for failure.
    if (isFail(response.fail)) return;
    //? Data verification.
    if (!isCorrectData(response.data)) return;
    //? Adding new data.
    pageData.overwritingPageData(response.data!);
    _setStatusPage(StatusContent.isViewContent);
  }

  // Setting the operation status.
  void _setActions(ActionStatus value) {
    actionStatus = value;
  }

  // Setting page status when loading data.
  void _setStatusPage(StatusContent val) {
    statusPage = val;
    notifyListeners();
  }

  /// Performs a check for an error in receiving or generating data.
  bool isFail(Failure? fail) {
    if (fail == null) return false;
    _setActions(ActionStatus.isDone);
    print(fail.msg); // Block for error logging.
    return true;
  }

  /// Checking for correct data
  bool isCorrectData(List<NewsEntity>? data) {
    if (data != null) return true;
    if (pageData.listNews.isEmpty) {
      // Used if the data could not be loaded at all.
      _setStatusPage(StatusContent.isNoContent);
    } else {
      // Used when the data to download has run out.
      _setStatusPage(StatusContent.isEmptyContent);
    }
    return false;
  }
}
