import 'package:news_test/core/errors/exception.dart';
import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/data/api/interfaces/api_shared.dart';
import 'package:news_test/domain/entities/interfaces/client_dto.dart';
import 'package:news_test/domain/entities/vo/news_bar.dart';
import 'package:news_test/domain/repository/news_bar.dart';

/// Description of implements NewsBarRepository.
class NewsBarRepositoryImpl implements NewsBarRepository {
  NewsBarRepositoryImpl(this._sharedApi);
  final SharedApiRepository _sharedApi;

  @override
  Future<({NewsBarEntity? data, Failure? fail})> getNewsBarData() async {
    try {
      final response = await _sharedApi.getNewsBarData();
      //?
      if (response == null) return (data: null, fail: null);
      //? Parsing
      return (
        data: NewsBarEntity(response),
        fail: null,
      );
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error parsing data: ${e.toString()}'));
    }
  }

  @override
  Future<({bool? data, Failure? fail})> setNewsBarOptions(ClientDTO dto) async {
    try {
      final response = await _sharedApi.setNewsBarData(dto);
      //?
      //? Parsing
      return (
        data: response,
        fail: null,
      );
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error parsing data: ${e.toString()}'));
    }
  }
}
