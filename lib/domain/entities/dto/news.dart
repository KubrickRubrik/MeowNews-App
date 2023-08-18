import 'package:news_test/core/config/entity.dart';
import 'package:news_test/domain/entities/interfaces/dto.dart';

final class NewsDTO extends Dto<String> {
  final String? searchWord;
  final TargetNews target;
  final int page;
  final AvailableLanguageNews? language;
  final int pageSize;

  NewsDTO(
    this.page, {
    required this.target,
    this.searchWord,
    this.language,
    this.pageSize = 30,
  });

  @override
  String getDataRequest() {
    String requestString = '';
    if (target == TargetNews.featured) {
      requestString = 'everything?';
      requestString += 'q=$searchWord';
      requestString += '&sortBy=popularity';
    } else {
      requestString = 'everything?';
      requestString += 'q=$searchWord';
      requestString += '&sortBy=publishedAt';
    }

    if (language != null) requestString += '&language=${language!.name}';
    requestString += '&pageSize=$pageSize&page=$page';
    return requestString;
  }
}
