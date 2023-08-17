final class ItemNewsEntity {
  bool isAvailable = false;
  final String? author;
  final BannersItemNewsEntity banner;
  final ContentItemNewsEntity content;
  final DateTime? publishedAt;

  ItemNewsEntity({
    required this.author,
    required this.banner,
    required this.content,
    required String? publishedAt,
  }) : publishedAt = DateTime.tryParse(publishedAt!);

  ItemNewsEntity.empty()
      : author = '',
        banner = BannersItemNewsEntity.empty(),
        content = ContentItemNewsEntity.empty(),
        publishedAt = null;
}

final class ContentItemNewsEntity {
  final String title;
  final String? description;

  ContentItemNewsEntity({
    required this.title,
    required this.description,
  });
  ContentItemNewsEntity.empty()
      : title = '',
        description = null;
}

final class BannersItemNewsEntity {
  final String? mainUrl;

  BannersItemNewsEntity({required this.mainUrl});

  BannersItemNewsEntity.empty() : mainUrl = null;
}
