import 'package:auto_route/auto_route.dart';
import 'package:everestwalktest/core/configs/spacing_size.dart';
import 'package:everestwalktest/core/configs/style/colors.dart';
import 'package:everestwalktest/core/configs/style/text_styles.dart';
import 'package:everestwalktest/core/routes/app_router.dart';
import 'package:everestwalktest/core/widgets/button/primary_btn.dart';
import 'package:everestwalktest/core/widgets/custom_error_widget.dart';
import 'package:everestwalktest/core/widgets/image_builder.dart';
import 'package:everestwalktest/core/widgets/loading_widget/shimmer_helper.dart';
import 'package:everestwalktest/features/shared/provider/movie/now_playing_provider.dart';
import 'package:everestwalktest/features/shared/provider/movie/popular_movie_provider.dart';
import 'package:everestwalktest/features/shared/provider/movie/trending_movie_provider.dart';
import 'package:everestwalktest/features/shared/provider/movie/upcoming_movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/api_constants.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Stack(
            children: [
              TrendingMovies(),
              Positioned(
                right: 16,
                top: 16,
                child: CircleAvatar(child: Icon(Icons.search)),
              )
            ],
          ),
          NowPlayingWidget(),
          PopularMovieWidget(),
          UpcomingWidget(),
          Spacing.sizedBoxH_32(),
        ],
      ),
    );
  }
}

class NowPlayingWidget extends HookConsumerWidget {
  const NowPlayingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlayingState = ref.watch(nowPlayingMovieProvider);
    return Column(
      children: [
        TitleWidget(
            title: "Now Playing",
            func: () {
              context.router.push(NowPlayingAllRoute());
            }),
        nowPlayingState.when(data: (data) {
          return SizedBox(
            height: 200,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: ImageBuilder(
                        url:
                            "${ApiConstants.imageBaseUrl}${data[index].posterPath}"),
                  ),
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
          return ShimmerHelper()
              .buildBasicShimmer(context: context, height: 200);
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

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.func, required this.title});
  final String title;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.heading5,
            ),
          ),
          PrimaryButton(
            text: "View All",
            func: func,
            btnColor: Colors.transparent,
            textColor: Palette.primaryColor,
          )
        ],
      ),
    );
  }
}

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
          autoPlayAnimationDuration: Duration(seconds: 3),
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
      return ShimmerHelper().buildBasicShimmer(context: context, height: 200);
    }, error: (e, st) {
      return CustomErrorWidget(errorMsg: e.toString(), onBtnTapped: () {});
    }, onGoingLoading: (data) {
      return ShimmerHelper().buildBasicShimmer(context: context, height: 200);
    }, onGoingError: (data, e, st) {
      return CustomErrorWidget(errorMsg: e.toString(), onBtnTapped: () {});
    });
  }
}

class PopularMovieWidget extends HookConsumerWidget {
  const PopularMovieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularMovieState = ref.watch(popularMovieProvider);
    return Column(
      children: [
        TitleWidget(
            title: "Popular Movies",
            func: () {
              context.router.push(NowPlayingAllRoute());
            }),
        popularMovieState.when(data: (data) {
          return SizedBox(
            height: 200,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 1.6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          child: ImageBuilder(
                            url:
                                "${ApiConstants.imageBaseUrl}${data[index].backdropPath}",
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black54,
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        data[index].title ?? "",
                                        style: AppTextStyle.heading5,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: data[index]
                                                    .releaseDate
                                                    .toString(),
                                                style: AppTextStyle.overline)
                                          ],
                                          text: "Released On: ",
                                          style: AppTextStyle.overline.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(data[index].voteAverage.toString())
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
          return ShimmerHelper()
              .buildBasicShimmer(context: context, height: 200);
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
              context.router.push(NowPlayingAllRoute());
            }),
        upcomingMovieState.when(data: (data) {
          return SizedBox(
            height: 200,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 1.6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: ImageBuilder(
                        url:
                            "${ApiConstants.imageBaseUrl}${data[index].backdropPath}"),
                  ),
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
          return ShimmerHelper()
              .buildBasicShimmer(context: context, height: 200);
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
