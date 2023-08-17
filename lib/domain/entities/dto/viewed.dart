import 'dart:convert';

import 'package:news_test/data/models/dto/dto.dart';

final class ViewedNewsDTO extends Dto<String> {
  final List<String> listIdNews;
  ViewedNewsDTO(this.listIdNews);

  @override
  String getDataRequest() {
    return jsonEncode(listIdNews);
  }
}