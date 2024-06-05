import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/application/model/now_playing.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=095e1e073eeee9e22f122f26cb0ef1ed';

Future<List<NowPlaying>> getAllNowPlaying() async {
  int maxRetries = 3;
  while (maxRetries >= 0) {
    try {
      final _response = await http.get(Uri.parse(getUrl));
      if (_response.statusCode == 200) {
        final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;
        final _data = NowplayingList.fromJson(_bodyAsJson['results']);
        if (kDebugMode) {
          print(_data.nowplayingList[0].overview);
        }
        return _data.nowplayingList;
      } else {
        maxRetries--;
      }
    } catch (e) {
      log(e.toString());
    }
  }
  return [];
}
