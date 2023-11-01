// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ErrorScreen(
          key: args.key,
          function: args.function,
          showRefresh: args.showRefresh,
          animation: args.animation,
          subtitle: args.subtitle,
          title: args.title,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    NoInternetRoute.name: (routeData) {
      final args = routeData.argsAs<NoInternetRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NoInternetScreen(
          key: args.key,
          onConnection: args.onConnection,
        ),
      );
    },
    NowPlayingAllRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NowPlayingAllScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [ErrorScreen]
class ErrorRoute extends PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    Key? key,
    required void Function() function,
    bool showRefresh = true,
    String animation = "assets/animations/error.json",
    String subtitle = "Try refreshing",
    String title = "Something wrong occured",
    List<PageRouteInfo>? children,
  }) : super(
          ErrorRoute.name,
          args: ErrorRouteArgs(
            key: key,
            function: function,
            showRefresh: showRefresh,
            animation: animation,
            subtitle: subtitle,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const PageInfo<ErrorRouteArgs> page = PageInfo<ErrorRouteArgs>(name);
}

class ErrorRouteArgs {
  const ErrorRouteArgs({
    this.key,
    required this.function,
    this.showRefresh = true,
    this.animation = "assets/animations/error.json",
    this.subtitle = "Try refreshing",
    this.title = "Something wrong occured",
  });

  final Key? key;

  final void Function() function;

  final bool showRefresh;

  final String animation;

  final String subtitle;

  final String title;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, function: $function, showRefresh: $showRefresh, animation: $animation, subtitle: $subtitle, title: $title}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoInternetScreen]
class NoInternetRoute extends PageRouteInfo<NoInternetRouteArgs> {
  NoInternetRoute({
    Key? key,
    required void Function(bool)? onConnection,
    List<PageRouteInfo>? children,
  }) : super(
          NoInternetRoute.name,
          args: NoInternetRouteArgs(
            key: key,
            onConnection: onConnection,
          ),
          initialChildren: children,
        );

  static const String name = 'NoInternetRoute';

  static const PageInfo<NoInternetRouteArgs> page =
      PageInfo<NoInternetRouteArgs>(name);
}

class NoInternetRouteArgs {
  const NoInternetRouteArgs({
    this.key,
    required this.onConnection,
  });

  final Key? key;

  final void Function(bool)? onConnection;

  @override
  String toString() {
    return 'NoInternetRouteArgs{key: $key, onConnection: $onConnection}';
  }
}

/// generated route for
/// [NowPlayingAllScreen]
class NowPlayingAllRoute extends PageRouteInfo<void> {
  const NowPlayingAllRoute({List<PageRouteInfo>? children})
      : super(
          NowPlayingAllRoute.name,
          initialChildren: children,
        );

  static const String name = 'NowPlayingAllRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
