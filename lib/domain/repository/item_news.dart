import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/interfaces/server_dto.dart';
import 'package:news_test/domain/entities/vo/item_news.dart';

/// Description of ItemNewsRepository.
abstract interface class ItemNewsRepository {
  /// Description of getItemNews
  Future<({ItemNewsEntity? data, Failure? fail})> getItemNews(ServerDTO dto);
}
