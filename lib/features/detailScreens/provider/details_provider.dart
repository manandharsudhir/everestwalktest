import 'package:everestwalktest/features/detailScreens/model/movie_detail_model.dart';
import 'package:everestwalktest/features/detailScreens/repo/details_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final detailsProvider = FutureProvider.family<MovieDetailModel, int>(
    (ref, id) => ref.read(detailsRepo).getMovieDetails(id: id));
