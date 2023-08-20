import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/interfaces/client_dto.dart';
import 'package:news_test/domain/entities/vo/session.dart';

/// Description case of NewsCase.
abstract interface class SessionRepository {
  /// Description of getSettingsOptions
  Future<({SessionSettingsEntity? data, Failure? fail})> initSettingsOptions();

  /// Description of setSettingsOptions
  Future<({bool? data, Failure? fail})> setSettingsOptions(ClientDTO dto);
}
