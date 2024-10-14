
import 'dart:convert';

import 'package:http/http.dart';
import 'package:instagram/repository/model%20class/post%20model.dart';
import '../../model class/followers model.dart';
import '../../model class/following model.dart';
import '../../model class/highlight model.dart';
import '../../model class/insta model.dart';
import '../../model class/tag model.dart';
import '../api client.dart';

class InstaApi {
  ApiClient apiClient = ApiClient();


  Future<InstaModel> getInsta(String name) async {
    String trendingpath = 'https://instagram-scraper-api2.p.rapidapi.com/v1/info?username_or_id_or_url=$name';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return InstaModel.fromJson(jsonDecode(response.body));
  }
  Future<Highlight> gethighlight(String name) async {
    String trendingpath = 'https://instagram-scraper-api2.p.rapidapi.com/v1/highlights?username_or_id_or_url=$name';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Highlight.fromJson(jsonDecode(response.body));
  }
  Future<Post> getpost(String name) async {
    String trendingpath = 'https://instagram-scraper-api2.p.rapidapi.com/v1.2/posts?username_or_id_or_url=$name'
        ;
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Post.fromJson(jsonDecode(response.body));
  }
  Future<Tag> getTag(String name) async {
    String trendingpath = 'https://instagram-scraper-api2.p.rapidapi.com/v1/tagged?username_or_id_or_url=$name';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Tag.fromJson(jsonDecode(response.body));
  }
  Future<Followers> getfollowers(String name) async {
    String trendingpath = 'https://instagram-scraper-api2.p.rapidapi.com/v1/followers?username_or_id_or_url=$name';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Followers.fromJson(jsonDecode(response.body));
  }
  Future<Following> getfollowing(String name) async {
    String trendingpath = 'https://instagram-scraper-api2.p.rapidapi.com/v1/following?username_or_id_or_url=$name';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Following.fromJson(jsonDecode(response.body));
  }

}