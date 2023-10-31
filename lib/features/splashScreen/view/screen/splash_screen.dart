import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/routes/app_router.dart';

@RoutePage()
class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useMemoized(() {
      Future.delayed(
        const Duration(seconds: 3),
        () => context.router.replaceAll([HomeRoute()]),
      );
    });
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 100),
      ),
    );
  }
}
