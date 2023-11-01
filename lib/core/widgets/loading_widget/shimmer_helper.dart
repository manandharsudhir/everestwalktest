import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shimmer/shimmer.dart';

import '../../configs/spacing_size.dart';

class ShimmerHelper {
  buildBasicShimmer({
    double height = double.infinity,
    double width = double.infinity,
    required BuildContext context,
  }) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).splashColor,
      highlightColor: Theme.of(context).canvasColor,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }

  buildListShimmer(
      {int itemCount = 10,
      double itemHeight = 100.0,
      double padding = 16,
      bool isScrollable = false,
      Widget? shimmerItem}) {
    return ListView.separated(
      itemCount: itemCount,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.all(padding),
      physics: isScrollable
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => Spacing.sizedBoxH_08(),
      itemBuilder: (context, index) {
        return shimmerItem ??
            ShimmerHelper()
                .buildBasicShimmer(height: itemHeight, context: context);
      },
    );
  }

  buildHorizontalListShimmer(
      {int itemCount = 10,
      double itemHeight = 100.0,
      double aspectRatio = 1,
      double padding = 16,
      bool isScrollable = false,
      Widget? shimmerItem}) {
    return SizedBox(
      height: itemHeight,
      child: ListView.separated(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.all(padding),
        physics: isScrollable
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => Spacing.sizedBoxW_08(),
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: aspectRatio,
            child: shimmerItem ??
                ShimmerHelper()
                    .buildBasicShimmer(height: itemHeight, context: context),
          );
        },
      ),
    );
  }

  builGridShimmer(
      {int itemCount = 10, bool isScrollable = false, Widget? shimmerItem}) {
    return ResponsiveGridView.builder(
      gridDelegate: const ResponsiveGridDelegate(
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        maxCrossAxisExtent: 200,
      ),
      itemBuilder: (context, index) =>
          ShimmerHelper().buildBasicShimmer(context: context),
      itemCount: itemCount,
      padding: const EdgeInsets.all(20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
