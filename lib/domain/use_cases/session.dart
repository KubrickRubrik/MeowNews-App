import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/interfaces/client_dto.dart';
import 'package:news_test/domain/entities/vo/session.dart';
import 'package:news_test/domain/repository/session.dart';

/// Description case of SessionCase.
final class SessionCase implements SessionRepository {
  SessionCase(this._newsRepository);
  final SessionRepository _newsRepository;

  @override
  Future<({SessionSettingsEntity? data, Failure? fail})> initSettingsOptions() async {
    final response = await _newsRepository.initSettingsOptions();
    return response;
  }

  @override
  Future<({bool? data, Failure? fail})> setSettingsOptions(ClientDTO dto) async {
    final response = await _newsRepository.setSettingsOptions(dto);
    return response;
  }
}
