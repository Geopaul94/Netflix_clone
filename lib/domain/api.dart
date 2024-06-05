import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/core/colors/constants.dart';

import 'package:netflix/domain/models/model.dart';

class Api {
  static const _trendingUrl =
      "https://api.themoviedb.org/3/trending/movie/week?api_key=$apikey";

  Future<List<DownloadModel>> getTrending() async {
    final response = await http.get(Uri.parse(_trendingUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData
          .map((downloadModel) => DownloadModel.fromJson(downloadModel))
          .toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }
}
