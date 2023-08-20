import 'package:news_test/core/errors/exception.dart';
import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/data/api/interfaces/api_server.dart';
import 'package:news_test/data/mapper/news.dart';
import 'package:news_test/domain/entities/interfaces/server_dto.dart';
import 'package:news_test/domain/entities/vo/item_news.dart';
import 'package:news_test/domain/repository/item_news.dart';

/// Description of implements ItemNewsRepositoryImpl.
class ItemNewsRepositoryImpl implements ItemNewsRepository {
  ItemNewsRepositoryImpl(this._apiEnvelope);
  final ServerApiRepository _apiEnvelope;

  @override
  Future<({ItemNewsEntity? data, Failure? fail})> getItemNews(ServerDTO dto) async {
    try {
      //?
      final response = await _apiEnvelope.getItemNews(dto);
      if (response == null) return (data: null, fail: null);
      //?
      final result = EntitiesNewsMapper.itemNewsMapper(response);
      //? Parsing
      return (data: result, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error parsing data: ${e.toString()}'));
    }
  }
}
