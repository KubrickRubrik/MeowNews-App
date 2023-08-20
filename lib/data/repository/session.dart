import 'package:news_test/core/errors/exception.dart';
import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/data/api/interfaces/api_shared.dart';
import 'package:news_test/domain/entities/interfaces/client_dto.dart';
import 'package:news_test/domain/entities/vo/session.dart';
import 'package:news_test/domain/repository/session.dart';

/// Description of implements SessionRepository.
class SessionRepositoryImpl implements SessionRepository {
  SessionRepositoryImpl(this._apiEnvelope);
  final SharedApiRepository _apiEnvelope;

  @override
  Future<({SessionSettingsEntity? data, Failure? fail})> initSettingsOptions() async {
    try {
      final response = await _apiEnvelope.initSessionOptions();
      //? Parsing
      return (data: SessionSettingsEntity(response), fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error parsing data: ${e.toString()}'));
    }
  }

  @override
  Future<({bool? data, Failure? fail})> setSettingsOptions(ClientDTO dto) async {
    try {
      final response = await _apiEnvelope.setSessionOptions(dto);
      return (data: response, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error parsing data: ${e.toString()}'));
    }
  }
}
