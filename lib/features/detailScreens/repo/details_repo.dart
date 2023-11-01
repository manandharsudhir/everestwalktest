import 'package:everestwalktest/core/constants/api_constants.dart';
import 'package:everestwalktest/core/services/network/base_client.dart';
import 'package:everestwalktest/features/detailScreens/model/movie_detail_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/models/exceptions/network_exception.dart';

class DetailsRepo {
  Future<MovieDetailModel> getMovieDetails({required int id}) async {
    try {
      final response = await BaseClient.instance.get(ApiConstants.movie(id));

      return MovieDetailModel.fromJson(response);
    } on NetworkExceptions catch (e) {
      throw e.errorMessage;
    } catch (e) {
      rethrow;
    }
  }
}

final detailsRepo = Provider((ref) => DetailsRepo());
