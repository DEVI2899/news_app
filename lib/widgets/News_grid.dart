import 'package:flutter/material.dart';

import '../Screens/news_details_screen.dart';
import '../view_models/news_view_model.dart';
import 'circle_image.dart';

class Newsgrid extends StatelessWidget {
  late final List<NewsViewModel> articles;

  Newsgrid({required this.articles});

  void _showNewsArticleDetails(BuildContext context, NewsViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsDetailScreen(
        article: vm,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: articles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
          (MediaQuery.of(context).orientation == Orientation.portrait)
              ? 2
              : 3),
      itemBuilder: (BuildContext _, int index) {
        final article = articles[index];

        return GestureDetector(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          child: GridTile(
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Text(
                article.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: CircleImage(
                imageUrl: article.urlToImage,
              ),
            ),
          ),
        );
      },
    );
  }
}
