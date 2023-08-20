import 'package:news_test/core/errors/exception.dart';
import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/data/api/interfaces/api_server.dart';
import 'package:news_test/data/mapper/news.dart';
import 'package:news_test/domain/entities/interfaces/server_dto.dart';
import 'package:news_test/data/models/news.dart';
import 'package:news_test/domain/entities/vo/news.dart';
import 'package:news_test/domain/entities/vo/news_set.dart';
import 'package:news_test/domain/repository/news.dart';

/// Description of implements NewsRepository.
class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this._serverApi);
  final ServerApiRepository _serverApi;

  @override
  Future<({NewsSet? data, Failure? fail})> getNews({required ServerDTO featuredNews, required ServerDTO latestNews}) async {
    try {
      final response = await _serverApi.getNews(featuredNews: featuredNews, latestNews: latestNews);
      //?
      final resFeaturedNews = _prepareResponse(response.featuredNews);
      final resLatestNews = _prepareResponse(response.latestNews);
      //? Parsing
      return (
        data: NewsSet(featuredNews: resFeaturedNews, latestdNews: resLatestNews),
        fail: null,
      );
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error parsing data: ${e.toString()}'));
    }
  }

  @override
  Future<({List<NewsEntity>? data, Failure? fail})> getMoreNews(ServerDTO dto) async {
    try {
      final response = await _serverApi.getMoreNews(dto);
      //?
      final result = _prepareResponse(response);
      //? Parsing
      return (data: result, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error parsing data: ${e.toString()}'));
    }
  }

  @override
  Future<({List<String>? data, Failure? fail})> setViewedNews(ServerDTO dto) async {
    try {
      final response = await _serverApi.setViewedNews(dto);
      //? Parsing
      return (data: response, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error parsing data: ${e.toString()}'));
    }
  }

  /// Check status response and prepare data news.
  List<NewsEntity>? _prepareResponse(List<NewsModel>? data) {
    if (data == null) return null;
    return data.map((e) => EntitiesNewsMapper.newsMapper(e)).toList();
  }
}
