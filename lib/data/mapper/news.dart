import 'package:news_test/data/models/news.dart';
import 'package:news_test/domain/entities/news.dart';

/// Description EntitiesMapper
abstract final class EntitiesNewsMapper {
  /// Description of newsMapper
  static NewsEntity newsMapper(NewsModel model) {
    return NewsEntity(
      idNews: model.idNews,
      banner: BannersNewsEntity(mainUrl: model.mainBanner, additionsUrls: model.additionBanner),
      titleNews: model.titleNews,
      descriptionNews: model.descriptionNews,
    );
  }
}
