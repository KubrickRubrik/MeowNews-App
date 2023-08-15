class NewsEntity {
  final String author;
  final String banner;
  final ContentNews content;
  final String published;
  final SourceNews source;

  NewsEntity({
    required this.author,
    required this.banner,
    required this.content,
    required this.published,
    required this.source,
  });
}

final class ContentNews {
  final String title;
  final String description;
  final String content;

  ContentNews({
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

final class SourceNews {
  final int id;
  final String name;

  SourceNews({
    required this.id,
    required this.name,
  });
}
