import 'package:news_test/data/models/news_bar.dart';
import 'package:news_test/data/models/session.dart';
import 'package:news_test/domain/entities/interfaces/client_dto.dart';

/// Description of ApiEnvelope.
abstract interface class SharedApiRepository {
  /// Description of getSettingsOptions.
  Future<SessionModel> initSessionOptions();

  /// Description of setSettingsOptions.
  Future<bool> setSessionOptions(ClientDTO dto);

  /// Description of getNewsBarData.
  Future<NewsBarModel?> getNewsBarData();

  /// Description of setNewsBarData.
  Future<bool> setNewsBarData(ClientDTO dto);
}
