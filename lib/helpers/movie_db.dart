import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'internet_helper.dart';

Future<MovieDb> getMovieData({@required String cacheName}) async {
  String urlExplore = 'https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=ccba7c87d5dfd633cd23788ba0dfd9b2';

  return readData(urlExplore, cacheName: cacheName);
}

Future<MovieDb> readData(String url,{String cacheName}) async {
  if (await checkInternet() == true) {
    final http.Response response = await http.Client().get(url);
    if (response.statusCode == 200) {
      // has internet
//      print('has internet and saving $cacheName');
      saveCache(cacheName ,response.body);
      return compute(movieDbFromMap, response.body);
    } else {
      print('Internet on but error when reading API');
      throw Exception('Exception: Internet on but Error when reading API');
    }
  } else {
//    print('No Internet $cacheName'); // no internet
    if (await getCache(cacheName) == null) {
      // no cache
      print('No cache, error when reading API');
      throw Exception('Exception: Error when reading API');
    } else {
//      print('Read data from $cacheName');
      String cacheJsonCategory = await getCache(cacheName);
      return compute(movieDbFromMap, cacheJsonCategory);
    }
  }
}

Future<String> getCache(String cacheName) async {
  final prefs = await SharedPreferences.getInstance();
  final movieCache = prefs.getString(cacheName) ?? null;
  return movieCache;
}

Future saveCache(String cacheName, String jsonString,) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(cacheName, jsonString);
}

MovieDb movieDbFromMap(String str) => MovieDb.fromMap(json.decode(str));

class MovieDb {
  MovieDb({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  final int page;
  final int totalResults;
  final int totalPages;
  final List<Result> results;

  factory MovieDb.fromMap(Map<String, dynamic> json) => MovieDb(
    page: json["page"],
    totalResults: json["total_results"],
    totalPages: json["total_pages"],
    results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
  );

}

class Result {
  Result({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  final double popularity;
  final int voteCount;
  final bool video;
  final String posterPath;
  final int id;
  final bool adult;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final List<int> genreIds;
  final String title;
  final double voteAverage;
  final String overview;
  final DateTime releaseDate;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    popularity: json["popularity"].toDouble(),
    voteCount: json["vote_count"],
    video: json["video"],
    posterPath: json["poster_path"],
    id: json["id"],
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    title: json["title"],
    voteAverage: json["vote_average"].toDouble(),
    overview: json["overview"],
    releaseDate: DateTime.parse(json["release_date"]),
  );

}
