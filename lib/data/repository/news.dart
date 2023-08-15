import 'package:news_test/core/errors/exception.dart';
import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/data/api/interfaces/api.dart';
import 'package:news_test/data/mapper/news.dart';
import 'package:news_test/domain/entities/news.dart';
import 'package:news_test/domain/repository/news.dart';

/// Description of implements NewsRepository
class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this._apiEnvelope);
  final ApiEnvelope _apiEnvelope;

  @override
  Future<({List<NewsEntity>? data, Failure? fail})> getNews(int offset) async {
    try {
      final response = await _apiEnvelope.getNews(offset);
      if (response == null || response.isEmpty) return (data: null, fail: null);
      final result = response.map((e) => EntitiesNewsMapper.newsMapper(e)).toList();
      return (data: result, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      throw (data: null, fail: DataFormatFailuer('Error api data'));
    }
  }
}
