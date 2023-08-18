final class ItemNewsEntity {
  final String? author;
  final BannersItemNewsEntity banner;
  final ContentItemNewsEntity content;
  final SourceItemNewsEntity source;
  final DateTime? publishedAt;

  ItemNewsEntity({
    required this.author,
    required this.banner,
    required this.content,
    required this.source,
    required String? publishedAt,
  }) : publishedAt = DateTime.tryParse(publishedAt!);

  ItemNewsEntity.empty()
      : author = '',
        banner = BannersItemNewsEntity.empty(),
        content = ContentItemNewsEntity.empty(),
        source = SourceItemNewsEntity.empty(),
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

final class SourceItemNewsEntity {
  final String id;
  final String name;

  SourceItemNewsEntity({
    required this.id,
    required this.name,
  });

  SourceItemNewsEntity.empty()
      : id = '',
        name = '';
}
