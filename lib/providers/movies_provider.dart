import 'dart:convert';

import 'package:filmin/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'a65beb78ae29fceac5f376609c14c70b';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print('MoviesProvider Inicializado');
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);
    //final Map<String, dynamic> decodedData = jsonDecode(response.body);
    //print(response.body);
    print(nowPlayingResponse.results[5].title);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromRawJson(response.body);
    popularMovies = [...popularMovies, ...popularResponse.results];
    //print('AAAAAA $popularResponse');
    notifyListeners();
  }
}
