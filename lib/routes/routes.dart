import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/SignUp/signup_screen.dart';
import 'package:injurydoctor/bindings/signup_bindings.dart';
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
      binding: SignupBindings(),
    ),
  ];

  static Future<dynamic>? appRoutes(final String routeName) {
    switch (routeName) {
      case RouteNames.splash:
      case RouteNames.onboarding:
      case RouteNames.login:
        return Get.offAllNamed(routeName);
      case RouteNames.signup:
      case RouteNames.age:
      case RouteNames.weight:
      case RouteNames.height:
      case RouteNames.gender:
      case RouteNames.hurting:
      case RouteNames.servey1:
      case RouteNames.servey2:
      case RouteNames.servey3:
      case RouteNames.servey4:
      case RouteNames.home:
      case RouteNames.alarm:
      case RouteNames.todaysexercise:
        return Get.toNamed(routeName);
      default:
        return _errorRoute();
    }
  }

  static Future<dynamic>? _errorRoute() {
    return Get.to(Container());
  }
}
