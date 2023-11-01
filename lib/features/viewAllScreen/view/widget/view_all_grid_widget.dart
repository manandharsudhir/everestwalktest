import 'package:everestwalktest/features/shared/model/movieModel/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/widgets/image_builder.dart';

class ViewAllGridWidget extends StatelessWidget {
  const ViewAllGridWidget({super.key, required this.movieList});
  final List<MovieModel> movieList;
  @override
  Widget build(BuildContext context) {
    return ResponsiveGridView.builder(
      gridDelegate: const ResponsiveGridDelegate(
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        maxCrossAxisExtent: 200,
      ),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        child: ImageBuilder(
            url: "${ApiConstants.imageBaseUrl}${movieList[index].posterPath}"),
      ),
      itemCount: movieList.length,
      padding: const EdgeInsets.all(20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
