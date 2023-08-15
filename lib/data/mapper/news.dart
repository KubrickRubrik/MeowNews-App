import 'package:news_test/data/models/news.dart';
import 'package:news_test/domain/entities/news.dart';

/// Description EntitiesMapper
abstract final class EntitiesNewsMapper {
  //
  static NewsEntity newsMapper(NewsModel model) {
    return NewsEntity(
      idApp: model.idApp,
      enabledSound: model.enabledSound,
    );
  }
}
