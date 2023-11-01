import 'package:everestwalktest/core/constants/api_constants.dart';
import 'package:everestwalktest/core/services/network/base_client.dart';
import 'package:everestwalktest/features/shared/model/movieModel/movie_model.dart';
import 'package:everestwalktest/features/shared/repo/movie/movie_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/exceptions/network_exception.dart';

final movieRepo = Provider((ref) => MovieRepoImpl());

class MovieRepoImpl extends MovieRepo {
  @override
  Future<List<MovieModel>> getPopularMovies(
      {int page = 1, Map<String, dynamic> filters = const {}}) async {
    try {
      final Map<String, dynamic> filter = {"page": page};
      if (filters.isNotEmpty) {
        filter.addAll(filters);
      }
      final response = await BaseClient.instance
          .get(ApiConstants.popular, queryParameters: filter);

      return (response["results"] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } on NetworkExceptions catch (e) {
      throw e.errorMessage;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies(
      {required int page, Map<String, dynamic> filters = const {}}) async {
    try {
      final Map<String, dynamic> filter = {"page": page};
      if (filters.isNotEmpty) {
        filter.addAll(filters);
      }
      final response = await BaseClient.instance
          .get(ApiConstants.nowPlaying, queryParameters: filter);

      return (response["results"] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } on NetworkExceptions catch (e) {
      throw e.errorMessage;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies(
      {required int page, Map<String, dynamic> filters = const {}}) async {
    try {
      final Map<String, dynamic> filter = {"page": page};
      if (filters.isNotEmpty) {
        filter.addAll(filters);
      }
      final response = await BaseClient.instance
          .get(ApiConstants.trendingPerDay, queryParameters: filter);

      return (response["results"] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } on NetworkExceptions catch (e) {
      throw e.errorMessage;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies(
      {required int page, Map<String, dynamic> filters = const {}}) async {
    try {
      final Map<String, dynamic> filter = {"page": page};
      if (filters.isNotEmpty) {
        filter.addAll(filters);
      }
      final response = await BaseClient.instance
          .get(ApiConstants.upcoming, queryParameters: filter);

      return (response["results"] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } on NetworkExceptions catch (e) {
      throw e.errorMessage;
    } catch (e) {
      rethrow;
    }
  }
}
