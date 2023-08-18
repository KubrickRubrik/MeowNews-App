import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/vo/item_news.dart';
import 'package:news_test/domain/use_cases/item_news.dart';
part 'state.dart';
part 'entity/status.dart';
part 'entity/page_data.dart';

final class ItemNewsProvider extends ChangeNotifier with _State {
  ItemNewsProvider(this._newsCase);
  final ItemNewsCase _newsCase;

  // Set news detail view data.
  void setItemNews(ItemNewsEntity itemNews) {
    pageData.overwritingPageData(itemNews);
  }

  void reset() {
    pageData.reset();
  }
}
