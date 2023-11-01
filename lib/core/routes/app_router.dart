import 'package:auto_route/auto_route.dart';
import 'package:everestwalktest/features/detailScreens/view/screen/detail_screen.dart';
import 'package:everestwalktest/features/errorScreens/error_screen.dart';
import 'package:everestwalktest/features/errorScreens/nointernet_screen.dart';
import 'package:everestwalktest/features/homepage/view/screen/home_screen.dart';
import 'package:everestwalktest/features/searchScreen/view/screen/search_screen.dart';
import 'package:everestwalktest/features/splashScreen/view/screen/splash_screen.dart';
import 'package:everestwalktest/features/viewAllScreen/view/screen/now_playing_all_screen.dart';
import 'package:everestwalktest/features/viewAllScreen/view/screen/popular_all_screen.dart';
import 'package:everestwalktest/features/viewAllScreen/view/screen/upcoming_all_screen.dart';
import 'package:flutter/material.dart';

import 'route_guards.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
          guards: [
            NetworkConnectionGuard(),
          ],
        ),
        AutoRoute(page: NoInternetRoute.page),
        AutoRoute(page: ErrorRoute.page),
        AutoRoute(
          page: HomeRoute.page,
          guards: [
            NetworkConnectionGuard(),
          ],
        ),
        AutoRoute(
          page: NowPlayingAllRoute.page,
          guards: [
            NetworkConnectionGuard(),
          ],
        ),
        AutoRoute(
          page: PopularAllRoute.page,
          guards: [
            NetworkConnectionGuard(),
          ],
        ),
        AutoRoute(
          page: UpcomingAllRoute.page,
          guards: [
            NetworkConnectionGuard(),
          ],
        ),
        AutoRoute(
          page: SearchRoute.page,
          guards: [
            NetworkConnectionGuard(),
          ],
        ),
        AutoRoute(
          page: DetailRoute.page,
          guards: [
            NetworkConnectionGuard(),
          ],
        ),
      ];
}
