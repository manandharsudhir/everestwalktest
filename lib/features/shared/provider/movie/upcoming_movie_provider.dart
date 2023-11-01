import 'package:everestwalktest/features/shared/model/movieModel/movie_model.dart';
import 'package:everestwalktest/features/shared/repo/movie/movie_repo_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../pagination/model/paginated_state_model.dart';
import '../../../pagination/provider/pagination_notifier.dart';

final upcomingMovieProvider = StateNotifierProvider<
    PaginationNotifier<MovieModel>, PaginationState<MovieModel>>((ref) {
  return PaginationNotifier(
    itemsPerBatch: 20,
    fetchNextItems: (
      item,
      page,
    ) {
      return ref.read(movieRepo).getUpcomingMovies(
            page: page,
          );
    },
  )..init();
});
