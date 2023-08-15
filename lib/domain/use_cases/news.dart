import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/news.dart';
import 'package:news_test/domain/repository/news.dart';

/// Description case of NewsCase.
class NewsCase implements NewsRepository {
  NewsCase(this._newsRepository);
  final NewsRepository _newsRepository;

  @override
  Future<({List<NewsEntity>? data, Failure? fail})> getNews(int offset) async {
    final response = await _newsRepository.getNews(offset);
    return response;
  }
}
