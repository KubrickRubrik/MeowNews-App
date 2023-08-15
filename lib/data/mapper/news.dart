import 'package:news_test/data/models/news.dart';
import 'package:news_test/domain/entities/vo/news.dart';

/// Description EntitiesMapper.
abstract final class EntitiesNewsMapper {
  /// Description of newsMapper.
  static NewsEntity newsMapper(NewsModel model) {
    return NewsEntity(
      author: author,
      banner: banner,
      content: content,
      published: published,
      source: source,
    );
  }
}
