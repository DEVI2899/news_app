import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

import '../utils/constants.dart';

class WebService{
  var dio = Dio();

  Future<List<Newsmodel>> fetchnews() async{
    String url = Constants.TOP_HEADLINES_URL;
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => Newsmodel.fromJson(article)).toList();
    } else {
      throw Exception("Failled to get top news");
    }
  }

}