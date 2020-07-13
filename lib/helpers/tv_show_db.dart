import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'internet_helper.dart';
import 'movie_db.dart';

Future<TvShowDb> getTvShowData({@required String cacheName}) async {
  String urlExplore = 'https://api.themoviedb.org/3/discover/tv?sort_by=popularity.desc&api_key=ccba7c87d5dfd633cd23788ba0dfd9b2';

  return readData(urlExplore, cacheName: cacheName);
}

Future<TvShowDb> readData(String url,{String cacheName}) async {
  if (await checkInternet() == true) {
    final http.Response response = await http.Client().get(url);
    if (response.statusCode == 200) {
      // has internet
//      print('has internet and saving $cacheName');
      saveCache(cacheName ,response.body);
      return compute(tvShowDbFromMap, response.body);
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
      return compute(tvShowDbFromMap, cacheJsonCategory);
    }
  }
}

TvShowDb tvShowDbFromMap(String str) => TvShowDb.fromMap(json.decode(str));


class TvShowDb {
  TvShowDb({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  final int page;
  final int totalResults;
  final int totalPages;
  final List<Result> results;

  factory TvShowDb.fromMap(Map<String, dynamic> json) => TvShowDb(
    page: json["page"],
    totalResults: json["total_results"],
    totalPages: json["total_pages"],
    results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
  );
}

class Result {
  Result({
    this.originalName,
    this.genreIds,
    this.name,
    this.popularity,
    this.originCountry,
    this.voteCount,
    this.firstAirDate,
    this.backdropPath,
    this.originalLanguage,
    this.id,
    this.voteAverage,
    this.overview,
    this.posterPath,
  });

  final String originalName;
  final List<int> genreIds;
  final String name;
  final double popularity;
  final List<String> originCountry;
  final int voteCount;
  final DateTime firstAirDate;
  final String backdropPath;
  final String originalLanguage;
  final int id;
  final double voteAverage;
  final String overview;
  final String posterPath;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    originalName: json["original_name"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    name: json["name"],
    popularity: json["popularity"].toDouble(),
    originCountry: List<String>.from(json["origin_country"].map((x) => x)),
    voteCount: json["vote_count"],
    firstAirDate: DateTime.parse(json["first_air_date"]),
    backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
    originalLanguage: json["original_language"],
    id: json["id"],
    voteAverage: json["vote_average"].toDouble(),
    overview: json["overview"],
    posterPath: json["poster_path"],
  );
}
