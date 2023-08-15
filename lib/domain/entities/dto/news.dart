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
      requestString = 'everything?';
      requestString += (searchWord == null) ? 'q=IT' : 'q=$searchWord';
    } else {
      requestString = 'top-headlines?';
      if (searchWord != null) requestString += 'q=$searchWord';
      if (country != null) requestString += 'country=${country!.name}';
    }

    if (language != null) requestString += '&language=${language!.name}';
    if (category != null) requestString += '&category=${category!.name}';
    requestString += '&pageSize=$pageSize&page=$page';

    return requestString;
  }
}

// https://newsapi.org/v2/everything?country=ru&languagelanguage=ru&pageSize=10&page=0&apiKey=b0b6c5d2af35492ab5a95bd1e63c9561
// https://newsapi.org/v2/everything?q=apple&from=2023-08-14&to=2023-08-14&sortBy=popularity&apiKey=b0b6c5d2af35492ab5a95bd1e63c9561