

import 'package:flutter/material.dart';
import 'package:news_app/Services/web_service.dart';
import 'package:news_app/models/news_model.dart';

import 'news_view_model.dart';


enum LoadingStatus{
  completed,
  searching ,
  empty
}
class NewsListViewModel with ChangeNotifier{
  LoadingStatus loadingStatus = LoadingStatus.empty;

  List<NewsViewModel> articles =  <NewsViewModel>[];

  void newsHeadlines() async{
     loadingStatus = LoadingStatus.searching;
    List<Newsmodel> newsmodels = await WebService().fetchnews();
    notifyListeners();
    articles= newsmodels.map((article) => NewsViewModel(article:article)).cast<NewsViewModel>().toList();


    if(articles.isEmpty){
     loadingStatus = LoadingStatus.empty;
    }
    else{
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();

  }
}