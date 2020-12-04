import 'package:flutter/material.dart';
import 'package:newsapi/components/ArticleTile.dart';
import 'package:newsapi/models/article_model.dart';
import 'package:newsapi/models/category_model.dart';
import 'package:newsapi/components/CategoryCard.dart';

CategoryModel categoryModel = CategoryModel();
ArticleModel articleModel = ArticleModel();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];

  void getHeadlines() async {
    articles = await articleModel.getHeadlines();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    categories = categoryModel.getCategories();
    getHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('World'),
            Text(
              'News',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    categoryName: categories[index].categoryName,
                    imageURL: categories[index].imageURL,
                  );
                },
              ),
            ),
            isLoading
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    flex: 5,
                    child: ListView.separated(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => Divider(
                              color: Colors.black,
                              height: 1,
                            ),
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return ArticleTile(
                              title: articles[index].title,
                              imageURL: articles[index].urlToImage,
                              description: articles[index].description,
                              url: articles[index].url);
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}
