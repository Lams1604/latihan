import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http: api.themovie.org/3";
  static const String apiKey = 'cd8eabfaf58df48043f4f96d8a696877';
  
  Future<List<Map<String, dynamic>>> getAllMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey'));
    final data = jsonDecode((response.body));
    return List<Map<String,dynamic>>.from(data['results']);
  }
  Future<List<Map<String, dynamic>>> getTrendingAllMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/week?api_key=$apiKey'));
    final data = jsonDecode((response.body));
    return List<Map<String,dynamic>>.from(data['results']);
  }
  Future<List<Map<String, dynamic>>> getPopularAllMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
    final data = jsonDecode((response.body));
    return List<Map<String,dynamic>>.from(data['results']);
  }
}