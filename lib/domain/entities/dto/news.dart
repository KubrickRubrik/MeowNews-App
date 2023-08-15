import 'package:news_test/data/models/dto/dto.dart';

final class NewsDTO extends Dto {
  final int offset;

  NewsDTO(this.offset);

  @override
  Map<String, dynamic> toMapRequest() {
    return {
      "action": super.actionApi,
      "data": {
        "offset": offset,
      },
    };
  }
}
