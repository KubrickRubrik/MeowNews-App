class NewsEntity {
  final int idNews;
  final BannersNewsEntity banner;
  final String titleNews;
  final String descriptionNews;

  NewsEntity({
    required this.idNews,
    required this.banner,
    required this.titleNews,
    required this.descriptionNews,
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
