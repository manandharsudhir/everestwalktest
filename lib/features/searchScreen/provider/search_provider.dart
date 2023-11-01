import 'package:everestwalktest/features/searchScreen/repo/search_repo_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../pagination/model/paginated_state_model.dart';
import '../../pagination/provider/pagination_notifier.dart';
import '../../shared/model/movieModel/movie_model.dart';

final searchMovieProvider = StateNotifierProvider.family<
    PaginationNotifier<MovieModel>,
    PaginationState<MovieModel>,
    String>((ref, query) {
  return PaginationNotifier(
    itemsPerBatch: 20,
    fetchNextItems: (
      item,
      page,
    ) {
      return ref.read(searchRepo).searchMovie(
        page: page,
        searchQuery: query,
        filters: {},
      );
    },
  )..init();
});
