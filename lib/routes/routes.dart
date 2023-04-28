import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/SignUp/signup_screen.dart';
import 'package:injurydoctor/routes/route_names.dart';
import '../Signin/login_Screen.dart';
import '../Splash Screen/splash.dart';
import '../bindings/login_bindings.dart';
import '../bindings/splash_binding.dart';

class AppRoutes {
  static List<GetPage> getPage = [
    GetPage(
      name: RouteNames.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: RouteNames.signup,
      page: () => SignupScreen(),
      binding: LoginBindings(),
    ),
  ];

  static Future<dynamic>? appRoutes(final String routeName) {
    switch (routeName) {
      case RouteNames.splash:
      case RouteNames.onboarding:
      case RouteNames.login:
        return Get.offAllNamed(routeName);
      case RouteNames.signup:
        return Get.toNamed(routeName);
      default:
        return _errorRoute();
    }
  }

  static Future<dynamic>? _errorRoute() {
    return Get.to(Container());
  }
}
