import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/interfaces/client_dto.dart';
import 'package:news_test/domain/entities/vo/news_bar.dart';

/// Description of NewsRepository.
abstract interface class NewsBarRepository {
  /// Description of getNewsBarData
  Future<({NewsBarEntity? data, Failure? fail})> getNewsBarData();

  /// Description of getNewsBarData
  Future<({bool? data, Failure? fail})> setNewsBarOptions(ClientDTO dto);
}
