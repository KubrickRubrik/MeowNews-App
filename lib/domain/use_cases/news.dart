import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/data/models/dto/dto.dart';
import 'package:news_test/domain/entities/vo/news.dart';
import 'package:news_test/domain/entities/vo/news_set.dart';
import 'package:news_test/domain/repository/news.dart';

/// Description case of NewsCase.
class NewsCase implements NewsRepository {
  NewsCase(this._newsRepository);
  final NewsRepository _newsRepository;

  @override
  Future<({NewsSet? data, Failure? fail})> getInitNews({required Dto featuredNews, required Dto latestNews}) async {
    final response = await _newsRepository.getInitNews(featuredNews: featuredNews, latestNews: latestNews);
    return response;
  }

  @override
  Future<({List<NewsEntity>? data, Failure? fail})> getMoreNews(Dto dto) async {
    final response = await _newsRepository.getMoreNews(dto);
    return response;
  }

  @override
  Future<({List<String>? data, Failure? fail})> setViewedNews(Dto dto) async {
    final response = await _newsRepository.setViewedNews(dto);
    return response;
  }
}
