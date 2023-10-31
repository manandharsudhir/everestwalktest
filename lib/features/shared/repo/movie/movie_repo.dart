import 'package:everestwalktest/features/shared/model/movieModel/movie_model.dart';

abstract class MovieRepo {
  Future<List<MovieModel>> getPopularMovies(
      {int page, Map<String, dynamic> filters});
  Future<List<MovieModel>> getNowPlayingMovies(
      {int page, Map<String, dynamic> filters});
}
