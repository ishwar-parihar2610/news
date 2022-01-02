import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/constant/string.dart';
import 'package:news/models/newsinfo.dart';

class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel = null;

    try {
      var response = await client.get(Uri.parse(Strings.news_url));
      var statusCode = response.statusCode;

      if (response.statusCode == 200) {
        var jsonString = response.body;

        var jsonMap = json.decode(jsonString);

         newsModel = NewsModel.fromJson(jsonMap);

        print('my news model <<<<< : $newsModel');
      }
    } catch (Exception) {
      return newsModel;
    }
    return  newsModel;
  }
}
