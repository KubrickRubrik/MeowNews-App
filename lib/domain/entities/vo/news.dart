class NewsEntity {
  final String author;
  final String banner;
  final ContentNewsEntity content;
  final String published;
  final SourceNewsEntity source;

  NewsEntity({
    required this.author,
    required this.banner,
    required this.content,
    required this.published,
    required this.source,
  });
}

final class ContentNewsEntity {
  final String title;
  final String description;
  final String content;

  ContentNewsEntity({
    required this.title,
    required this.description,
    required this.content,
  });
}

final class BannersNewsEntity {
  final String mainUrl;
  // Not use now
  final List<String> additionsUrls;

  BannersNewsEntity({
    required this.mainUrl,
    List<String> additionsUrls = const [],
  }) : additionsUrls = [...additionsUrls];
}

final class SourceNewsEntity {
  final int? id;
  final String name;

  SourceNewsEntity({
    required this.id,
    required this.name,
  });
}
