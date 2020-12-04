import 'package:newsapi/constants.dart';
import 'package:newsapi/network_helper/network_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

const headlinesURL = 'https://newsapi.org/v2/top-headlines?country=us&apiKey';
const categoryURL = 'https://newsapi.org/v2/top-headlines?country=us&category';


@JsonSerializable()
class ArticleModel {
  ArticleModel(
      {this.author,
      this.content,
      this.description,
      this.title,
      this.url,
      this.urlToImage,
      this.publishedAt});

  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String publishedAt;

  Future<List<ArticleModel>> getHeadlines() async {
    List<ArticleModel> articles = [];
    NetworkHelper networkHelper = NetworkHelper('$headlinesURL=$apiKey');
    var articlesData = await networkHelper.getData();
    articles = processArticlesJSON(articlesData);
    return articles;
  }

  Future<List<ArticleModel>> getArticlesByCategory(String category) async {
    List<ArticleModel> articles = [];
    NetworkHelper networkHelper =
        NetworkHelper('$categoryURL=$category&apiKey=$apiKey');
    var articlesData = await networkHelper.getData();
    articles = processArticlesJSON(articlesData);
    return articles;
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}


List<ArticleModel> processArticlesJSON(dynamic data) {
  List<ArticleModel> articles = [];
  if (data['status'] == 'ok') {
    data['articles'].forEach((element) {
      if (element['urlToImage'] != null && element['description'] != null) {
        articles.add(ArticleModel(
            author: element['author'],
            content: element['content'],
            description: element['description'],
            title: element['title'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            publishedAt: element['publishedAt']));
      }
    });
  }
  return articles;
}
