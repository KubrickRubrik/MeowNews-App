import 'dart:convert';

import 'package:news_test/domain/entities/interfaces/server_dto.dart';

final class ViewedNewsDTO extends ServerDTO<String> {
  final List<String> listIdNews;
  ViewedNewsDTO(this.listIdNews);

  @override
  String getDataRequest() {
    return jsonEncode(listIdNews);
  }
}
