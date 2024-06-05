import 'package:http/http.dart'as http;
import 'package:netflix/application/controller/upcoming/upcoming.dart';

class DownloadModel {
  final String backdropPath;
  final int id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final bool adult;
  final String title;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  DownloadModel({
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.title,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory DownloadModel.fromJson(Map<String, dynamic> json) {
    return DownloadModel(
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'] ?? 0,
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      mediaType: json['media_type'] ?? '',
      adult: json['adult'] ?? false,
      title: json['title'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      popularity: (json['popularity'] as num).toDouble(),
      releaseDate: json['release_date'] ?? '',
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'adult': adult,
      'title': title,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'popularity': popularity,
      'release_date': releaseDate,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
