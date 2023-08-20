import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_test/core/errors/exception.dart';
import 'package:news_test/data/api/core/server/request/request.dart';
import 'package:news_test/data/api/interfaces/api_server.dart';
import 'package:news_test/domain/entities/interfaces/server_dto.dart';
import 'package:news_test/data/models/item_news.dart';
import 'package:news_test/data/models/news.dart';
import 'package:news_test/domain/entities/dto/item_news.dart';
import 'package:news_test/domain/entities/dto/news.dart';
import 'package:news_test/domain/entities/dto/viewed.dart';

/// Description ApiServer.
class ServerApi with _AdditionAction implements ServerApiRepository {
  final apiServer = http.Client();

  @override
  Future<({List<NewsModel>? featuredNews, List<NewsModel>? latestNews})> getNews({
    required ServerDTO featuredNews,
    required ServerDTO latestNews,
  }) async {
    final featuredQueryString = (featuredNews as NewsDTO).getDataRequest();
    final latestQueryString = (latestNews as NewsDTO).getDataRequest();
    //? Get featured news.
    final resFeaturedNews = await ConfigRequestServer.request(apiServer, query: featuredQueryString);
    //? Get latest news.
    final resLatestNews = await ConfigRequestServer.request(apiServer, query: latestQueryString);
    //? Check status response and prepare data news.
    final resultFeaturedNews = _prepareNewsResponse(resFeaturedNews);
    final resultLatestNews = _prepareNewsResponse(resLatestNews);
    //? Result.
    return (featuredNews: resultFeaturedNews, latestNews: resultLatestNews);
  }

  @override
  Future<List<NewsModel>?> getMoreNews(ServerDTO dto) async {
    final queryString = (dto as NewsDTO).getDataRequest();
    //? Get featured news.
    final response = await ConfigRequestServer.request(apiServer, query: queryString);
    //? Data existence check.
    if (response == null) return null;
    //? Check status response and prepare data news.
    final result = _prepareNewsResponse(response);
    //? Result.
    return result;
  }

  @override
  Future<List<String>?> setViewedNews(ServerDTO dto) async {
    // The news source API does not have an implementation of
    // setting the news status to "viewed".
    //
    // Therefore, a list of news ID inputs is simply returned as a response.
    final queryString = (dto as ViewedNewsDTO).getDataRequest();
    final response = jsonDecode(queryString);
    final result = (response as List).map((e) => e.toString()).toList();
    return result;
    // //? Get featured news.
    // final response = await ConfigRequestServer.request(apiServer, query: queryString);
    // //? Data existence check.
    // if (response == null) return null;
    // //? Check status response and prepare data news.
    // //? Result.
    // return result;
  }

  @override
  Future<ItemNewsModel?> getItemNews(ServerDTO dto) async {
    final request = (dto as ItemNewsDTO).getDataRequest();
    //? Get featured news.
    final response = await ConfigRequestServer.request(apiServer, query: request);
    //? Check status response and prepare data news.
    final result = _prepareItemNewsResponse(response);
    //? Result.
    return result;
  }
}

mixin _AdditionAction {
  /// Check status response and prepare data news.
  List<NewsModel>? _prepareNewsResponse(Map<String, dynamic>? data) {
    if (data == null) return null;
    if (data['status'] == 'error') throw ApiException("Error server api: ${data['message']}");
    final listArticles = data['articles'] as List<dynamic>;
    if (listArticles.isEmpty) return null;
    return listArticles.map((value) => NewsModel(value)).toList();
  }

  /// Check status response and prepare data news.
  ItemNewsModel? _prepareItemNewsResponse(Map<String, dynamic>? data) {
    if (data == null) return null;
    if (data['status'] == 'error') throw ApiException("Error server api: ${data['message']}");
    final article = data['articles'];
    if (article == null) return null;
    return ItemNewsModel(article);
  }
}
