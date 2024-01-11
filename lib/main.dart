import 'package:flutter/material.dart';
import 'package:news_app/Screens/news_screen.dart';
import 'package:news_app/view_models/news_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:MultiProvider(
          providers:[
            ChangeNotifierProvider(
                create:(_)=> NewsListViewModel()),
          ],
      child: const NewsScreen()),
      debugShowCheckedModeBanner: false,

    );
  }
}

