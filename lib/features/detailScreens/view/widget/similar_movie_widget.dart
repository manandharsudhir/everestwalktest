import 'package:everestwalktest/core/configs/style/text_styles.dart';
import 'package:everestwalktest/features/shared/provider/movie/similar_movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/configs/spacing_size.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/loading_widget/shimmer_helper.dart';
import '../../../shared/widget/movie_item_widget.dart';

class SimilarMoviesWidget extends HookConsumerWidget {
  const SimilarMoviesWidget({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMovieState = ref.watch(similarMovieProvider(id));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "Similar Movies",
            style: AppTextStyle.heading5,
          ),
        ),
        similarMovieState.when(data: (data) {
          return SizedBox(
            height: 200,
            child: ListView.separated(
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
