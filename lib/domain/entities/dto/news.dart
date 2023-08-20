import 'package:news_test/core/config/entity.dart';
import 'package:news_test/domain/entities/interfaces/server_dto.dart';

final class NewsDTO extends ServerDTO<String> {
  final String? searchWord;
  final TargetNews target;
  final int page;
  final AvailableNewsLanguages? language;
  final AvailableNewsSorting? sort;
  final int pageSize;

  NewsDTO(
    this.page, {
    required this.target,
    this.searchWord,
    this.language,
    this.sort,
    this.pageSize = 30,
  });

  @override
  String getDataRequest() {
    String requestString = '';
    if (target == TargetNews.featured) {
      requestString = 'everything?';
      requestString += 'q=$searchWord';
      requestString += '&sortBy=${sort!.name}';
    } else {
      requestString = 'everything?';
      requestString += 'q=$searchWord';
      requestString += '&sortBy=${sort!.name}';
    }

    if (language != null) requestString += '&language=${language!.name}';
    requestString += '&pageSize=$pageSize&page=$page';
    return requestString;
  }
}
