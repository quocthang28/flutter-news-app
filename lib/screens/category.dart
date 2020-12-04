import 'package:flutter/material.dart';
import 'package:newsapi/components/ArticleTile.dart';
import 'package:newsapi/models/article_model.dart';
import 'package:newsapi/models/category_model.dart';

ArticleModel articleModel = ArticleModel();
CategoryModel categoryModel = CategoryModel();

class Category extends StatefulWidget {
  Category({this.category});

  final String category;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isLoading = true;
  List<ArticleModel> articles = [];
  List<String> categoriesName = [];

  void getArticle() async {
    articles = await articleModel.getArticlesByCategory('${widget.category}');
    categoriesName = categoryModel.getCategoriesName();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
              '${widget.category[0].toUpperCase() + widget.category.substring(1)} News',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
      ),
      drawer: Drawer(
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                  height: 1,
                ),
            itemCount: categoriesName.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  categoriesName[index],
                  style: TextStyle(fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Category(
                                category:
                                    '${categoriesName[index].toLowerCase()}',
                              )));
                },
              );
            }),
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: <Widget>[
                  // Container(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                  //   child: Text(
                  //     '${widget.category[0].toUpperCase() + widget.category.substring(1)} News',
                  //     textAlign: TextAlign.left,
                  //     style: TextStyle(
                  //         fontSize: 25.0, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // ),
                  Expanded(
                    flex: 9,
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
