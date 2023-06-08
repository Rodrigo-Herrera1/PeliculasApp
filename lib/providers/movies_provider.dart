import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apikey = 'a491e7c4cd3546a09f39b382514d98fd';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDisplayMovies(); //this hace referencia a una clase creada
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final decodedData = json.decode(response.body) as Map<String, dynamic>;
    print(decodedData);
  }
}
