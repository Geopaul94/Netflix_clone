import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/application/model/upcoming.dart';





const url =
    'https://api.themoviedb.org/3/movie/upcoming?api_key=095e1e073eeee9e22f122f26cb0ef1ed';
Future<List<Upcoming>> getAllUpcoming() async {
  int count = 3;
  while(count>=0){
    final response = await http.get(Uri.parse(url));
  if(response.statusCode==200){
    final bodyAsResponse = jsonDecode(response.body) as Map;
  final result = UpcomingList.fromJson(bodyAsResponse['results']);
  if (kDebugMode) {
    if (kDebugMode) {
      print(result.upcomingList[0].imagePath);
    }
  }
  return result.upcomingList;
  }count --;
  }
  return [];
}