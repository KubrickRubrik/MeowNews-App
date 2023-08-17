import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/data/models/dto/dto.dart';
import 'package:news_test/domain/entities/vo/item_news.dart';
import 'package:news_test/domain/repository/item_news.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';

/// Description case of ItemNewsCase.
class ItemNewsCase implements ItemNewsRepository {
  ItemNewsCase(this._itemNewsRepository);
  final ItemNewsRepository _itemNewsRepository;

  @override
  Future<({ItemNewsEntity? data, Failure? fail})> getItemNews(Dto dto) async {
    final response = await _itemNewsRepository.getItemNews(dto);
    // return response;
    //! Little trick - `response` will always be null, since the data
    //! source does not allow getting news by ID
    return _useLittleTrick(dto);
  }

  _useLittleTrick(Dto dto) {
    final response2 = locator<NewsProvider>().pageData.useLittleTrick(dto);
    if (response2 == null) return null;
    return ItemNewsEntity(
      author: response2.author,
      banner: BannersItemNewsEntity(mainUrl: response2.banner.mainUrl),
      content: ContentItemNewsEntity(title: response2.content.title, description: response2.content.description),
      publishedAt: response2.publishedAt?.toIso8601String(),
    );
  }
}
