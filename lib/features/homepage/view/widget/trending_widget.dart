import 'package:everestwalktest/core/configs/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/image_builder.dart';
import '../../../../core/widgets/loading_widget/shimmer_helper.dart';
import '../../../shared/provider/movie/trending_movie_provider.dart';

class TrendingMovies extends HookConsumerWidget {
  const TrendingMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingMovieState = ref.watch(trendingMovieProvider);
    return trendingMovieState.when(data: (data) {
      return FlutterCarousel(
        options: CarouselOptions(
          height: 200.0,
          showIndicator: false,
          autoPlayAnimationDuration: const Duration(seconds: 3),
          enableInfiniteScroll: true,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: List.generate(data.length > 20 ? 20 : data.length, (index) {
          final movie = data[index];
          return Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ImageBuilder(
                  url:
                      "${ApiConstants.imageBaseUrl}${movie.backdropPath ?? ""}",
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movie.originalTitle ?? "",
                      style: AppTextStyle.heading4,
                    ),
                    Text(
                      movie.overview ?? "",
                      style: AppTextStyle.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      );
    }, loading: () {
      return ShimmerHelper().buildHorizontalListShimmer(
        aspectRatio: 1.6,
        itemHeight: 200,
      );
    }, error: (e, st) {
      return CustomErrorWidget(errorMsg: e.toString(), onBtnTapped: () {});
    }, onGoingLoading: (data) {
      return ShimmerHelper().buildBasicShimmer(context: context, height: 200);
    }, onGoingError: (data, e, st) {
      return CustomErrorWidget(errorMsg: e.toString(), onBtnTapped: () {});
    });
  }
}
