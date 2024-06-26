import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_application_8/api_config.dart';
import 'package:flutter_application_8/models/movie.dart';

class MovieService {
  static Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(
      '${ApiConfig.host}/movie/popular?api_key=${ApiConfig.apiKey}',
    ));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch movies');
    }
  }
}
