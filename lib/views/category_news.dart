import 'package:flutter/material.dart';
import 'package:news/helper/news.dart';
import 'package:news/models/article.dart';
import 'package:news/views/article_view.dart';

import 'home.dart';
class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles= List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    // this is called whenever the app starts
    super.initState();
    getCategoryNews();
  }
  getCategoryNews() async{
    CategoryNewsClass newsClass =CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles =newsClass.news;
    setState(() {
      _loading=false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("EZ"),
            Text("News", style:TextStyle(color: Colors.blueGrey))
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
          ]
      ),
      body: _loading? Center(
        child:CircularProgressIndicator()
      ):SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top:16),
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: articles.length ,
                itemBuilder: (context, index){
                  return BlogTile(
                      imageUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      desc:articles[index].description,
                      url:articles[index].url
                  );
                }
            )
        ),
      ),
    );
  }
}
