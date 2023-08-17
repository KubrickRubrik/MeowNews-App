import 'package:news_test/core/config/entity.dart';
import 'package:news_test/data/models/dto/dto.dart';

final class NewsDTO extends Dto<String> {
  final String? searchWord;
  final TargetNews target;
  final int page;
  final AvailableCountryNews? country;
  final AvailableLanguageNews? language;
  final AvailableCategoryNews? category;
  final int pageSize;

  NewsDTO(
    this.page, {
    required this.target,
    this.searchWord,
    this.country,
    this.language,
    this.category,
    this.pageSize = 30,
  });

  @override
  String getDataRequest() {
    String requestString = '';
    if (target == TargetNews.featured) {
      requestString = 'top-headlines?';
      requestString += (searchWord == null) ? 'q=IT' : 'q=$searchWord';
      requestString += '&sortBy=popularity';
    } else {
      requestString = 'everything?';
      requestString += (searchWord == null) ? 'q=IT' : 'q=$searchWord';
      requestString += '&sortBy=publishedAt';
    }
    if (language != null) requestString += '&language=${language!.name}';
    if (category != null) requestString += '&category=${category!.name}';
    requestString += '&pageSize=$pageSize&page=$page';

    return requestString;
  }
}
