import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String url;
  ArticleView({this.url});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer <WebViewController> _completer
  = Completer <WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("EZ"),
              Text("News", style:TextStyle(color: Colors.white30)),

            ],
          ),
          elevation: 0.0,
          actions: <Widget>[
           Opacity(
             opacity: 0,
             child: Container(
               padding: EdgeInsets.symmetric(horizontal: 16),
             child: Icon(Icons.save)
             ),
             ),
          ],
        ),
        body: Container(
          child: WebView(
            initialUrl: widget.url,
            onWebViewCreated: ((WebViewController webViewContoller){
              _completer.complete(webViewContoller);
            }),
          ),
        )
    );
  }
}
