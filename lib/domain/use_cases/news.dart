import 'package:news_test/core/errors/failure.dart';
import 'package:news_test/domain/entities/interfaces/client_dto.dart';
import 'package:news_test/domain/entities/interfaces/server_dto.dart';
import 'package:news_test/domain/entities/vo/news.dart';
import 'package:news_test/domain/entities/vo/news_bar.dart';
import 'package:news_test/domain/entities/vo/news_set.dart';
import 'package:news_test/domain/repository/news.dart';
import 'package:news_test/domain/repository/news_bar.dart';

/// Description case of NewsCase.
class NewsCase implements NewsRepository, NewsBarRepository {
  NewsCase(this._newsRepository, this._newsBarRepository);
  final NewsRepository _newsRepository;
  final NewsBarRepository _newsBarRepository;

  @override
  Future<({NewsSet? data, Failure? fail})> getNews({required ServerDTO featuredNews, required ServerDTO latestNews}) async {
    final response = await _newsRepository.getNews(featuredNews: featuredNews, latestNews: latestNews);
    return response;
  }

  @override
  Future<({List<NewsEntity>? data, Failure? fail})> getMoreNews(ServerDTO dto) async {
    final response = await _newsRepository.getMoreNews(dto);
    return response;
  }

  @override
  Future<({List<String>? data, Failure? fail})> setViewedNews(ServerDTO dto) async {
    final response = await _newsRepository.setViewedNews(dto);
    return response;
  }

  @override
  Future<({NewsBarEntity? data, Failure? fail})> getNewsBarData() async {
    final response = await _newsBarRepository.getNewsBarData();
    return response;
  }

  @override
  Future<({bool? data, Failure? fail})> setNewsBarOptions(ClientDTO dto) async {
    final response = await _newsBarRepository.setNewsBarOptions(dto);
    return response;
  }
}
