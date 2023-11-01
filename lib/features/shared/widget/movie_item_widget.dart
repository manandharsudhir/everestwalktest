import 'package:auto_route/auto_route.dart';
import 'package:everestwalktest/core/routes/app_router.dart';
import 'package:everestwalktest/core/utils/date_utils.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/style/text_styles.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/widgets/image_builder.dart';
import '../model/movieModel/movie_model.dart';
import 'movie_vote_widget.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget(
      {super.key,
      this.showPoster = false,
      this.aspectRatio = 1,
      required this.movie});
  final MovieModel movie;
  final double aspectRatio;
  final bool showPoster;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(DetailRoute(id: movie.id));
      },
      child: AspectRatio(
        aspectRatio: aspectRatio,
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
                      "${ApiConstants.imageBaseUrl}${showPoster ? movie.posterPath : movie.backdropPath}",
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        movie.title ?? "",
                        style: AppTextStyle.heading5,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: (movie.releaseDate ?? DateTime.now())
                                  .getFormattedDate(),
                              style: AppTextStyle.overline.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                          text: "Released On: ",
                          style: AppTextStyle.overline,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 16,
                top: 16,
                child: MovieVoteWidget(voteAverage: movie.voteAverage ?? 0.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
