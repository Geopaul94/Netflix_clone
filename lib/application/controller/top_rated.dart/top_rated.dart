import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/application/model/top_rated.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=095e1e073eeee9e22f122f26cb0ef1ed';

Future<List<TopRated>> getTopRatedMovies() async {
  int count = 3;

  while (count >= 0) {
    if (kDebugMode) {
      print('hii');
    }
    try {
      final response = await http.get(Uri.parse(getUrl));
      if (kDebugMode) {
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
        final data = TopRatedList.fromJson(bodyAsJson['results']);
        if (kDebugMode) {
          print('test');
        }
        return data.topRatedList;
      }
      count--;
    } catch (e) {
      print(e.toString());
    }
  }
  return [];
}
