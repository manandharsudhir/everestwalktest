import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/configs/style/styles.dart';
import 'core/routes/app_router.dart';

final appRouter = AppRouter();

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
        child: MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      title: 'Everestwalk Test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      builder: (context, widget) {
        widget = ResponsiveBreakpoints.builder(
          child: widget!,
          breakpoints: const [
            Breakpoint(start: 0, end: 450, name: MOBILE),
            Breakpoint(start: 451, end: 800, name: TABLET),
            Breakpoint(start: 801, end: 1920, name: DESKTOP),
            Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        );
        return widget;
      },
    ));
  }
}
