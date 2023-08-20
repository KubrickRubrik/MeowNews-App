import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/interfaces/server_dto.dart';
import 'package:news_test/domain/entities/vo/item_news.dart';
import 'package:news_test/domain/repository/item_news.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';

/// Description case of ItemNewsCase.
class ItemNewsCase implements ItemNewsRepository {
  ItemNewsCase(this._itemNewsRepository);
  final ItemNewsRepository _itemNewsRepository;

  @override
  Future<({ItemNewsEntity? data, Failure? fail})> getItemNews(ServerDTO dto) async {
    final response = await _itemNewsRepository.getItemNews(dto);
    // return response;
    //! Little trick - `response` will always be null, since the data
    //! source does not allow getting news by ID.
    // Therefore, a simulation of the operation is performed.
    return (data: _useLittleTrick(dto), fail: null);
  }

  // Little trick: the [ItemNewsEntity] object of the detailed view of the news
  // is created from the [NewsEntity] object of the list of [NewsProvider].
  ItemNewsEntity? _useLittleTrick(ServerDTO dto) {
    final response2 = locator<NewsProvider>().pageData.useLittleTrick(dto);
    if (response2 == null) return null;
    return ItemNewsEntity(
      author: response2.author,
      banner: BannersItemNewsEntity(mainUrl: response2.banner.mainUrl),
      content: ContentItemNewsEntity(title: response2.content.title, description: response2.content.description),
      source: SourceItemNewsEntity(id: response2.source.id, name: response2.source.name),
      publishedAt: response2.publishedAt?.toIso8601String(),
    )..viewed = response2.viewed;
  }
}
