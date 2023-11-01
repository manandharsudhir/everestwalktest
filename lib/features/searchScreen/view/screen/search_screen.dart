import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:everestwalktest/core/utils/debouncer.dart';
import 'package:everestwalktest/core/widgets/form_widget/form_field_widget.dart';
import 'package:everestwalktest/features/searchScreen/provider/search_provider.dart';
import 'package:everestwalktest/features/searchScreen/view/widget/typeto_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/widgets/loading_widget/shimmer_helper.dart';
import '../../../errorScreens/error_screen.dart';
import '../../../pagination/widgets/paginated_empty_widget.dart';
import '../../../pagination/widgets/paginated_error_widget.dart';
import '../../../pagination/widgets/paginated_loading_widget.dart';
import '../../../viewAllScreen/view/widget/view_all_grid_widget.dart';

@RoutePage()
class SearchScreen extends HookConsumerWidget {
  SearchScreen({super.key});
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchFieldController = useTextEditingController();
    final searchQuery = useState("");

    return Scaffold(
      appBar: AppBar(
        title: FormFieldWidget(
          name: "search",
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          autofocus: true,
          controller: searchFieldController,
          suffixIcon: IconButton(
              onPressed: () {
                searchFieldController.clear();
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.white,
              )),
          onChanged: (value) {
            _debouncer.run(() {
              searchQuery.value = value ?? "";
            });
          },
        ),
      ),
      body: searchQuery.value.isEmpty
          ? const TypetoSearchWidget()
          : SearchListWidget(searchquery: searchQuery.value),
    );
  }
}

class SearchListWidget extends StatefulHookConsumerWidget {
  const SearchListWidget({super.key, required this.searchquery});
  final String searchquery;

  @override
  ConsumerState<SearchListWidget> createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends ConsumerState<SearchListWidget> {
  late final ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(searchMovieProvider(widget.searchquery).notifier)
          .fetchFirstBatch();
      scrollController.addListener(() {
        double maxScroll = scrollController.position.maxScrollExtent;
        double currentScroll = scrollController.position.pixels;
        double delta = MediaQuery.of(context).size.width * 0.20;
        log(scrollController.position.pixels.toString());
        log(maxScroll.toString() + scrollController.position.pixels.toString());
        if (maxScroll - currentScroll <= delta) {
          ref
              .read(searchMovieProvider(widget.searchquery).notifier)
              .fetchNextBatch();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchMovieProvider(widget.searchquery));
    return RefreshIndicator(
      onRefresh: () async {
        await ref
            .read(searchMovieProvider(widget.searchquery).notifier)
            .fetchFirstBatch();
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
                            .read(searchMovieProvider(widget.searchquery)
                                .notifier)
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
                  ref
                      .read(searchMovieProvider(widget.searchquery).notifier)
                      .fetchFirstBatch();
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
