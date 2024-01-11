import 'package:flutter/material.dart';
import 'package:news_app/view_models/news_list_view_model.dart';
import 'package:provider/provider.dart';
import '../widgets/News_grid.dart';



class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  void initState(){
    super.initState();
    Provider.of<NewsListViewModel>(context, listen: false).newsHeadlines();
  }

  Widget _buildList(NewsListViewModel listviewnews) {
    switch (listviewnews.loadingStatus) {
      case LoadingStatus.searching:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Newsgrid(
            articles: listviewnews.articles,
          ),
        );
      case LoadingStatus.empty:
      default:
        return const Center(
          child: Text("No results found"),
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    var listviewnews = Provider.of<NewsListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue ,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'News',
                style: TextStyle(fontSize: 50),
              ),
            ),
            const Divider(
              height: 40,
              color: Color(0xffFF8A30),
              thickness: 8,
              indent: 30,
              endIndent: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 15, bottom: 15),
              child: Text(
                'Headline',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: _buildList(listviewnews),
            ),
          ],
        ),
      ),
    );
  }
}
