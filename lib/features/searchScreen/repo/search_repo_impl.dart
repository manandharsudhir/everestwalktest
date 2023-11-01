import 'package:everestwalktest/core/constants/api_constants.dart';
import 'package:everestwalktest/core/services/network/base_client.dart';
import 'package:everestwalktest/features/shared/model/movieModel/movie_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/exceptions/network_exception.dart';
import 'search_repo.dart';

final searchRepo = Provider((ref) => SearchRepoImpl());

class SearchRepoImpl extends SearchRepo {
  @override
  Future<List<MovieModel>> searchMovie(
      {int page = 1,
      required String searchQuery,
      Map<String, dynamic> filters = const {}}) async {
    try {
      final Map<String, dynamic> filter = {"page": page, "query": searchQuery};
      if (filters.isNotEmpty) {
        filter.addAll(filters);
      }
      final response = await BaseClient.instance
          .get(ApiConstants.search, queryParameters: filter);

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
