class NewsModel {
  final int idNews;
  final String mainBanner;
  final List<String> additionBanner;
  final String titleNews;
  final String descriptionNews;

  NewsModel(Map<String, dynamic> data)
      : idNews = data['id_news'],
        mainBanner = data['main_banner'],
        additionBanner = data['addition_banner'],
        titleNews = data['title_news'],
        descriptionNews = data['description_news'];
}
