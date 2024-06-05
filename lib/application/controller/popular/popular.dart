import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/application/model/popular.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/popular?api_key=095e1e073eeee9e22f122f26cb0ef1ed';

Future<List<Popular>> getAllPopular() async {
  int c = 3;
  while (c >= 0) {
    try {
      final response = await http.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
        final data = PopularList.fromJson(bodyAsJson['results']);
        if (kDebugMode) {
          print(data.popularList[0].overview);
        }
        return data.popularList;
      }
    } catch (e) {
      print(e.toString());
    }
    c--;
  }
  return [];
}
