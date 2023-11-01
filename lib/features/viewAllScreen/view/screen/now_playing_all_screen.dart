import 'package:auto_route/auto_route.dart';
import 'package:everestwalktest/features/shared/provider/movie/now_playing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/widgets/loading_widget/shimmer_helper.dart';
import '../../../errorScreens/error_screen.dart';
import '../../../pagination/widgets/paginated_empty_widget.dart';
import '../../../pagination/widgets/paginated_error_widget.dart';
import '../../../pagination/widgets/paginated_loading_widget.dart';
import '../widget/view_all_grid_widget.dart';

@RoutePage()
class NowPlayingAllScreen extends HookConsumerWidget {
  const NowPlayingAllScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nowPlayingMovieProvider);
    final scrollController = useScrollController();
    useMemoized(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        scrollController.addListener(() {
          double maxScroll = scrollController.position.maxScrollExtent;
          double currentScroll = scrollController.position.pixels;
          double delta = MediaQuery.of(context).size.width * 0.20;
          if (maxScroll - currentScroll <= delta) {
            ref.read(nowPlayingMovieProvider.notifier).fetchNextBatch();
          }
        });
      });
    });
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(nowPlayingMovieProvider.notifier).fetchFirstBatch();
      },
      child: ListView(
        controller: scrollController,
        children: [
          state.when(
            data: (items) {
              return items.isEmpty
                  ? PaginatedEmptyWidget(
                      func: () {
                        ref
                            .read(nowPlayingMovieProvider.notifier)
                            .fetchFirstBatch();
                      },
                    )
                  : ViewAllGridWidget(
                      movieList: items,
                    );
            },
            loading: () => ShimmerHelper().buildListShimmer(itemHeight: 200),
            error: (e, stk) {
              return ErrorScreen(
                function: () {
                  ref.read(nowPlayingMovieProvider.notifier).fetchFirstBatch();
                },
                title: e.toString(),
              );
            },
            onGoingLoading: (items) {
              return PaginatedLoadingWidget(
                  widget: ViewAllGridWidget(
                movieList: items,
              ));
            },
            onGoingError: (items, e, stk) {
              return PaginatedErrorWidget(
                title: e.toString(),
                widget: ViewAllGridWidget(
                  movieList: items,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
