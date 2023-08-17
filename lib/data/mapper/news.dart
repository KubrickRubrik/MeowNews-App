import 'package:news_test/data/models/vo/item_news.dart';
import 'package:news_test/data/models/vo/news.dart';
import 'package:news_test/domain/entities/vo/item_news.dart';
import 'package:news_test/domain/entities/vo/news.dart';

/// Description EntitiesMapper.
abstract final class EntitiesNewsMapper {
  /// Description of newsMapper.
  static NewsEntity newsMapper(NewsModel model) {
    return NewsEntity(
      author: model.author,
      banner: BannersNewsEntity(mainUrl: model.urlToImage),
      content: ContentNewsEntity(
        title: model.titleNews,
        description: model.descriptionNews,
      ),
      published: model.publishedAt,
      source: SourceNewsEntity(
        id: model.source.id,
        name: model.source.name,
      ),
    );
  }

  /// Description of itemNewsMapper.
  static ItemNewsEntity itemNewsMapper(ItemNewsModel model) {
    return ItemNewsEntity(
      author: model.author,
      banner: BannersItemNewsEntity(mainUrl: model.urlToImage),
      content: ContentItemNewsEntity(
        title: model.titleNews,
        description: model.descriptionNews,
      ),
      publishedAt: model.publishedAt,
    );
  }
}
