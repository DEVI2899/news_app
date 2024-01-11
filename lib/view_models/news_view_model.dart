

import 'package:intl/intl.dart';

import '../models/news_model.dart';

class NewsViewModel{
   Newsmodel _newsmodel;

  NewsViewModel({required Newsmodel article}) : _newsmodel = article;

  String get title{
    return _newsmodel.title;
  }
  String get description{
    return _newsmodel.description;
  }
  String get url{
   return _newsmodel.url;
  }
  String get urlToImage{
    return _newsmodel.urlToImage;
  }
  String get author{
   return _newsmodel.author;
  }
   String get content {
     return _newsmodel.content;
   }


   String get publishedAt {
     final dateTime = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(_newsmodel.publishedAt as String, true);
     return DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
  }
}
