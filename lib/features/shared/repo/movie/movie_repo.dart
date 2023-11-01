import 'package:everestwalktest/features/shared/model/movieModel/movie_model.dart';

abstract class MovieRepo {
  Future<List<MovieModel>> getPopularMovies(
      {required int page, Map<String, dynamic> filters});
  Future<List<MovieModel>> getNowPlayingMovies(
      {required int page, Map<String, dynamic> filters});
  Future<List<MovieModel>> getTrendingMovies(
      {required int page, Map<String, dynamic> filters});
  Future<List<MovieModel>> getUpcomingMovies(
      {required int page, Map<String, dynamic> filters});
}
