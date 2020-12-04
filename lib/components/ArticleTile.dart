import 'package:flutter/material.dart';
import 'package:newsapi/screens/article.dart';

class ArticleTile extends StatelessWidget {
  ArticleTile(
      {@required this.title,
      @required this.imageURL,
      @required this.description,
      @required this.url});

  final String title;
  final String imageURL;
  final String description;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Article(articleURL: url)));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(imageURL)),
              Text(
                '   $title',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '   $description',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17.0, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
