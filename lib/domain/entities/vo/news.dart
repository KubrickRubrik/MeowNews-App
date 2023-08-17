final class NewsEntity {
  final String? author;
  final BannersNewsEntity banner;
  final ContentNewsEntity content;
  final DateTime? publishedAt;
  final SourceNewsEntity source;
  bool viewed = false;

  NewsEntity({
    required this.author,
    required this.banner,
    required this.content,
    required String published,
    required this.source,
  }) : publishedAt = DateTime.tryParse(published);
}

final class ContentNewsEntity {
  final String title;
  final String? description;

  ContentNewsEntity({
    required this.title,
    required this.description,
  });
}

final class BannersNewsEntity {
  final String? mainUrl;

  BannersNewsEntity({required this.mainUrl});
}

final class SourceNewsEntity {
  final String? id;
  final String name;

  SourceNewsEntity({
    required this.id,
    required this.name,
  });
}
