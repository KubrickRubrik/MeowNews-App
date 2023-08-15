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
    String requestString = switch (target) {
      TargetNews.featured => 'everything?',
      TargetNews.latest => 'top-headlines?',
    };
    if (searchWord != null) requestString += 'q=$searchWord';
    if (country != null) requestString += '&country=$country';
    if (language != null) requestString += '&language=$language';
    if (category != null) requestString += '&category=$category';
    requestString += 'pageSize=$pageSize&page=$page';

    return requestString;
  }
}
