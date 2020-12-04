import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Article extends StatefulWidget {
  Article({@required this.articleURL});

  final String articleURL;

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  Completer<WebViewController> completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: WebView(
            initialUrl: widget.articleURL,
            onWebViewCreated: (controller) => completer.complete(controller),
          ),
        ),
      ),
    );
  }
}
