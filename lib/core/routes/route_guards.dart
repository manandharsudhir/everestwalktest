import 'package:auto_route/auto_route.dart';
// import 'package:abroadsathi/core/constants/storage_constant.dart';
// import 'package:abroadsathi/core/services/storage/storage_services.dart';
// import 'package:abroadsathi/features/auth/provider/auth_provider.dart';

import '../services/network/network_connection.dart';
import 'app_router.dart';
// import 'package:abroadsathi/features/auth/provider/auth_provider.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import 'app_router.dart';

// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     if (AuthProvider.hasToken()) {
//       // if user is authenticated we continue
//       resolver.next(true);
//     } else {
//       // we redirect the user to our login page
//       router.replaceAll([LoginRoute()]);
//     }
//   }
// }

// class OnboardingGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     try {
//       final bool showOnboarding =
//           SharedPreferencesImp.readBool(StorageConstant.showOnboarding);
//       if (!showOnboarding) {
//         router.push(LoginRoute());
//       } else {
//         resolver.next(true);
//       }
//     } catch (e) {
//       resolver.next(true);
//     }
//   }
// }

class NetworkConnectionGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final networkConnection = await NetworkConnectionCheck.checkConnection();
    if (!networkConnection) {
      router.push(NoInternetRoute(onConnection: (hasConnection) {
        if (hasConnection) {
          router.removeLast();
          resolver.next(hasConnection);
        }
      }));
    } else {
      // we redirect the user to our login page
      resolver.next(true);
    }
  }
}
