import 'package:everestwalktest/features/shared/model/movieModel/movie_model.dart';
import 'package:everestwalktest/features/shared/repo/movie/movie_repo_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../pagination/model/paginated_state_model.dart';
import '../../../pagination/provider/pagination_notifier.dart';

final similarMovieProvider = StateNotifierProvider.family<
    PaginationNotifier<MovieModel>,
    PaginationState<MovieModel>,
    int>((ref, id) {
  return PaginationNotifier(
    itemsPerBatch: 20,
    fetchNextItems: (
      item,
      page,
    ) {
      return ref.read(movieRepo).similarMovies(
            page: page,
            id: id,
          );
    },
  )..init();
});
