import 'package:news_test/data/models/news_bar.dart';

final class NewsBarEntity {
  final String languageOptions;
  final String sortOptions;

  NewsBarEntity(NewsBarModel model)
      : languageOptions = model.languageOptions,
        sortOptions = model.sortOptions;
}
