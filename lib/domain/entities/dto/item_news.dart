import 'package:news_test/core/config/entity.dart';
import 'package:news_test/domain/entities/interfaces/dto.dart';

final class ItemNewsDTO extends Dto<String> {
  final String? idSource;
  final TargetNews target;
  final int index;

  ItemNewsDTO(this.index, {required this.idSource, required this.target});
  @override
  String getDataRequest() {
    String requestString = '';
    if (target == TargetNews.featured) {
      requestString = 'top-headlines?sources=$idSource';
    } else {
      requestString = 'everything?sources=$idSource';
    }
    return requestString;
  }
}
