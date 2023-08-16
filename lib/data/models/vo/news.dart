class NewsModel {
  final String? author;
  final String titleNews;
  final String? descriptionNews;
  final String? contentNews;
  final String? urlToImage;
  final String publishedAt;
  final SourceNewsModel source;

  NewsModel(Map<String, dynamic> data)
      : author = data['author'],
        titleNews = data['title'],
        descriptionNews = data['description'],
        contentNews = data['content'],
        urlToImage = data['urlToImage'],
        publishedAt = data['publishedAt'],
        source = SourceNewsModel(data['source']);
}

final class SourceNewsModel {
  final String? id;
  final String name;

  SourceNewsModel(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'];
}
