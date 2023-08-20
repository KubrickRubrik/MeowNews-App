import 'package:news_test/domain/entities/interfaces/client_dto.dart';

final class NewsBarDTO extends ClientDTO<String> {
  final String? languageOptions;
  final String? sortOptions;

  NewsBarDTO({required this.languageOptions, required this.sortOptions});

  @override
  String getDataRequest() {
    return '';
  }
}
