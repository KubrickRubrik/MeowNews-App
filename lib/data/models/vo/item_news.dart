final class ItemNewsModel {
  final String? author;
  final String titleNews;
  final String? descriptionNews;
  final String? contentNews;
  final String? urlToImage;
  final String publishedAt;

  ItemNewsModel(Map<String, dynamic> data)
      : author = data['author'],
        titleNews = data['title'],
        descriptionNews = data['description'],
        contentNews = data['content'],
        urlToImage = data['urlToImage'],
        publishedAt = data['publishedAt'];
}
