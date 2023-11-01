import 'package:everestwalktest/features/shared/model/movieModel/movie_model.dart';

abstract class SearchRepo {
  Future<List<MovieModel>> searchMovie(
      {required int page,
      required String searchQuery,
      Map<String, dynamic> filters});
}
