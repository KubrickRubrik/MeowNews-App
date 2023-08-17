import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/dto/item_news.dart';
import 'package:news_test/domain/entities/vo/item_news.dart';
import 'package:news_test/domain/use_cases/item_news.dart';
part 'state.dart';
part 'entity/status.dart';
part 'entity/page_data.dart';

final class ItemNewsProvider extends ChangeNotifier with _State {
  ItemNewsProvider(this._newsCase);
  final ItemNewsCase _newsCase;

  /// Loading news data and setting the mark `viewed`
  // Since the news resource does not allow to
  // request news by ID, a little trick will be used in [ItemNewsCase].
  //
  Future<bool> getDetailNews(TargetNews target, String? idSource, int index) async {
    if (super.actionStatus == ActionStatus.isAction) return false;
    _setActionsPage(ActionStatus.isAction);
    //? Formation of request parameters.
    final newstDTO = ItemNewsDTO(index, idSource: idSource, target: target);
    _setContentStatus(StatusContent.isLoadContent);
    final response = await _newsCase.getItemNews(newstDTO);
    _setActionsPage(ActionStatus.isDone);
    //? Checking for failure.
    if (_isFail(response.fail) || response.data == null) {
      _setContentStatus(StatusContent.isLoadContent);
      return false;
    }
    //?
    pageData.overwritingPageData(response.data!);
    _setContentStatus(StatusContent.isViewContent);
    return true;
  }

  void _setContentStatus(StatusContent val) {
    status.statusItemNews = val;
    notifyListeners();
  }

  void reset() {
    pageData.reset();
  }
}
