import 'package:flutter/material.dart';
import 'package:news/models/newsinfo.dart';
import 'package:news/services/api_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageStateState createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePage> {
  Future<NewsModel>? _newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
        child: FutureBuilder(
            future: _newsModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                print(snapshot);
                return ListView.builder(
                    // itemCount: snapshot.data!.articles.length,
                    itemBuilder: (context, index) {
                    //   var article = snapshot.data!.articles[index];

                      return Container(
                        height: 100,
                        color: Colors.red,
                        // child: Row(
                        //   children: [Image.network(article.urlToImage)],
                        // ),
                      );
                    });
              } else
             
                return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
