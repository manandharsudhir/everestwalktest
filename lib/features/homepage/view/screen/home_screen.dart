import 'package:auto_route/auto_route.dart';
import 'package:everestwalktest/core/widgets/image_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              FlutterCarousel(
                options: CarouselOptions(
                  height: 260.0,
                  showIndicator: true,
                  enableInfiniteScroll: true,
                  slideIndicator: const CircularSlideIndicator(),
                  autoPlay: true,
                ),
                items: [1, 2, 3, 4, 5].map((i) {
                  return const ImageBuilder(
                      url:
                          "https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg");
                }).toList(),
              ),
              const Positioned(
                right: 16,
                top: 16,
                child: CircleAvatar(child: Icon(Icons.search)),
              )
            ],
          )
        ],
      ),
    );
  }
}
