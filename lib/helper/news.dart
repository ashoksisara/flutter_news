import 'dart:convert';

import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];
  String url = 'http://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=fe5cfb3f2085482c882a6540c149c2a2';

  Future<void> getNews() async{
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content']
          );
          news.add(articleModel);
        }

      });
    }
  }
}
class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{

    String url = 'http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=fe5cfb3f2085482c882a6540c149c2a2';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']
          );
          news.add(articleModel);
        }

      });
    }
  }
}