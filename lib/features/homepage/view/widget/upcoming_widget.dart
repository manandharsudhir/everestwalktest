import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/configs/spacing_size.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/loading_widget/shimmer_helper.dart';
import '../../../../core/widgets/title_widget.dart';
import '../../../shared/provider/movie/upcoming_movie_provider.dart';
import '../../../shared/widget/movie_item_widget.dart';

class UpcomingWidget extends HookConsumerWidget {
  const UpcomingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingMovieState = ref.watch(upcomingMovieProvider);
    return Column(
      children: [
        TitleWidget(
            title: "Upcoming Movies",
            func: () {
              context.router.push(const UpcomingAllRoute());
            }),
        upcomingMovieState.when(data: (data) {
          return SizedBox(
            height: 200,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return MovieItemWidget(
                  movie: data[index],
                  aspectRatio: 1.6,
                );
              },
              separatorBuilder: (context, index) {
                return Spacing.sizedBoxW_16();
              },
              itemCount: data.length > 20 ? 20 : data.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        }, loading: () {
          return ShimmerHelper().buildHorizontalListShimmer(
            aspectRatio: 1.6,
            itemHeight: 200,
          );
        }, error: (e, st) {
          return CustomErrorWidget(errorMsg: e.toString(), onBtnTapped: () {});
        }, onGoingLoading: (data) {
          return ShimmerHelper()
              .buildBasicShimmer(context: context, height: 200);
        }, onGoingError: (data, e, st) {
          return CustomErrorWidget(errorMsg: e.toString(), onBtnTapped: () {});
        }),
      ],
    );
  }
}
