import 'package:flutter/material.dart';

final class ItemNewsModel {
  final String? author;
  final String titleNews;
  final String? descriptionNews;
  final String? contentNews;
  final String? urlToImage;
  final SourceItemNewsModel source;
  final String publishedAt;

  ItemNewsModel(Map<String, dynamic> data)
      : author = data['author'],
        titleNews = data['title'],
        descriptionNews = data['description'],
        contentNews = data['content'],
        urlToImage = data['urlToImage'],
        source = SourceItemNewsModel(data['source']),
        publishedAt = data['publishedAt'];
}

final class SourceItemNewsModel {
  final String id;
  final String name;
  // UniqueKey is used because the news api
  // sometimes provides news without an ID.
  SourceItemNewsModel(Map<String, dynamic> data)
      : id = UniqueKey().toString(), // Another little trick
        name = data['name'];
}
