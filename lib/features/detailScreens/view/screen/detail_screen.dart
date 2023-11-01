import 'package:auto_route/auto_route.dart';
import 'package:everestwalktest/core/configs/spacing_size.dart';
import 'package:everestwalktest/core/configs/style/text_styles.dart';
import 'package:everestwalktest/core/constants/api_constants.dart';
import 'package:everestwalktest/core/utils/date_utils.dart';
import 'package:everestwalktest/core/widgets/custom_error_widget.dart';
import 'package:everestwalktest/core/widgets/image_builder.dart';
import 'package:everestwalktest/core/widgets/loading_widget/shimmer_helper.dart';
import 'package:everestwalktest/features/detailScreens/provider/details_provider.dart';
import 'package:everestwalktest/features/detailScreens/view/widget/similar_movie_widget.dart';
import 'package:everestwalktest/features/shared/widget/movie_vote_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class DetailScreen extends HookConsumerWidget {
  const DetailScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailsProvider(id));

    return Scaffold(
        body: detailState.when(data: (data) {
      return SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                ImageBuilder(
                  url: "${ApiConstants.imageBaseUrl}${data.backdropPath}",
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.title ?? "",
                                  style: AppTextStyle.heading3,
                                ),
                                Wrap(
                                  children: [
                                    Text(
                                      "${(data.releaseDate ?? DateTime.now()).getFormattedDate()} • ",
                                      style: AppTextStyle.overline,
                                    ),
                                    ...List.generate(
                                      data.genres.length,
                                      (index) => Text(
                                        "${data.genres[index].name}${index < (data.genres.length - 1) ? "," : ""} ",
                                        style: AppTextStyle.overline,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          MovieVoteWidget(voteAverage: data.voteAverage ?? 0.0),
                        ],
                      ),
                      Text(data.tagline ?? ""),
                      Spacing.sizedBoxH_16(),
                      const Text(
                        "Overview",
                        style: AppTextStyle.heading5,
                      ),
                      Text(
                        data.overview ?? "",
                        style: AppTextStyle.bodySmall,
                      ),
                      SimilarMoviesWidget(id: data.id ?? 0)
                    ],
                  ),
                )
              ],
            ),
            const Positioned(
              top: 16,
              left: 16,
              child: CircleAvatar(
                child: BackButton(),
              ),
            ),
          ],
        ),
      );
    }, error: (e, st) {
      return CustomErrorWidget(errorMsg: e.toString(), onBtnTapped: () {});
    }, loading: () {
      return Column(
        children: [
          ShimmerHelper().buildBasicShimmer(context: context, height: 200),
          Spacing.sizedBoxH_16(),
          ShimmerHelper().buildBasicShimmer(context: context, height: 100),
          Spacing.sizedBoxH_16(),
          ShimmerHelper().buildBasicShimmer(context: context, height: 100),
          Spacing.sizedBoxH_16(),
          ShimmerHelper().buildBasicShimmer(context: context, height: 200),
        ],
      );
    }));
  }
}
