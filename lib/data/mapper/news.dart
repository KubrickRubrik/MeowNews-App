import 'package:news_test/data/models/vo/news.dart';
import 'package:news_test/domain/entities/vo/news.dart';

/// Description EntitiesMapper.
abstract final class EntitiesNewsMapper {
  /// Description of newsMapper.
  static NewsEntity newsMapper(NewsModel model) {
    return NewsEntity(
      author: model.author,
      banner: model.urlToImage,
      content: ContentNewsEntity(
        title: model.titleNews,
        description: model.descriptionNews,
        content: model.contentNews,
      ),
      published: model.publishedAt,
      source: SourceNewsEntity(
        id: model.source.id,
        name: model.source.name,
      ),
    );
  }
}
