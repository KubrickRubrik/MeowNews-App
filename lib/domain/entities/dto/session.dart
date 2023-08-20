import 'package:news_test/domain/entities/interfaces/client_dto.dart';

final class SessionDTO extends ClientDTO {
  final String? theme;
  final String? locale;

  SessionDTO({required this.theme, required this.locale});

  @override
  getDataRequest() {}
}
