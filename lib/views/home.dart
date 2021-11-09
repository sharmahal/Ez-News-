import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/helper/data.dart';
import 'package:news/helper/news.dart';
import 'package:news/models/article.dart';
import 'package:news/models/category_model.dart';
import 'package:news/views/article_view.dart';
import 'package:news/views/category_news.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }

}

class _HomeState extends State<Home>{
  List<CategoryModel> categories = List<CategoryModel>();
  List<ArticleModel> articles =List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    // this is called whenever the app starts
    super.initState();
    categories = getCategories();
    getNews();
  }
  getNews() async{
    News newsClass =News();
    await newsClass.getNews();
    articles =newsClass.news;
    setState(() {
      _loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
         title:
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text("EZ",style: TextStyle(fontSize: 25),),
             Text("News", style:TextStyle(color: Colors.blueGrey)) ],
         ),
        elevation: 0.0,
      ),

      body: _loading ? Center(
        child:CircularProgressIndicator()
        ):
      SingleChildScrollView(
          child: Column(

            children: <Widget>[

              ///categories
              Container(
                margin: EdgeInsets.only(top:10, bottom: 10),
                height:70, //since the hieght of image is 60, container should be extra
                child: ListView.builder(
                  shrinkWrap: true, //if use list in column
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index){
                    return CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      categoryName: categories[index].categoryName
                    );
                  },

                )
              ),
              ///Blogs
              Container(
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
              )


            ],
          )
      ,
        ),
    );
  }

}

class CategoryTile extends StatelessWidget {

  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      Navigator.push(context, MaterialPageRoute(
        builder: (context)=> CategoryNews(
          category: categoryName.toString().toLowerCase(),
        )
      ));
      },
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: <Widget>[
          ClipRRect(
              child:CachedNetworkImage(imageUrl: imageUrl, width:120,height:60, fit:BoxFit.cover,)
          , borderRadius: BorderRadius.circular(6)),
          Container(
            alignment: Alignment.center,
          width:120, height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color:Colors.black26
          ),
            child: Text(categoryName, style: TextStyle(color: Colors.white),),
          )
        ],
      ),
        )
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title,desc,url;
  BlogTile({this.imageUrl, this.title, this.desc,this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
          builder:(context)=> ArticleView(
          url: url,
          )
        ));
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(child: Image.network(imageUrl),
            borderRadius: BorderRadius.circular(6),),
            Container( height: 8),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
            Container( height: 1),
            Text(desc, style: TextStyle(fontSize: 12, color: Colors.grey),)
          ],
        )

      ),
    );
  }
}
