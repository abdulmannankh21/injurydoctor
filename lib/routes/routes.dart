import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/Screens/Gender.dart';
import 'package:injurydoctor/Screens/HomeScreen.dart';
import 'package:injurydoctor/Screens/SelectAge.dart';
import 'package:injurydoctor/Screens/SelectHeight.dart';
import 'package:injurydoctor/Screens/SelectWeight.dart';
import 'package:injurydoctor/Screens/SetReminderScreen.dart';
import 'package:injurydoctor/Screens/Surve%20Screens/SurveScreen1.dart';
import 'package:injurydoctor/Screens/Surve%20Screens/SurveScreen2.dart';
import 'package:injurydoctor/Screens/Surve%20Screens/SurveScreen4.dart';
import 'package:injurydoctor/Screens/TodayScreen.dart';
import 'package:injurydoctor/Screens/WhatHurtingScreen.dart';
import 'package:injurydoctor/SignUp/signup_screen.dart';
import 'package:injurydoctor/bindings/all%20bindings.dart';
import 'package:injurydoctor/bindings/signup_bindings.dart';
import 'package:injurydoctor/routes/route_names.dart';
import '../Screens/Surve Screens/SurveScreen3.dart';
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
    GetPage(
      name: RouteNames.age,
      page: () => SelectAge(),
      binding: AgeBindings(),
    ),
    GetPage(
      name: RouteNames.weight,
      page: () => SelectWeight(),
      binding: WeightBindings(),
    ),
    GetPage(
      name: RouteNames.height,
      page: () => SelectHeight(),
      binding: HeightBindings(),
    ),
    GetPage(
      name: RouteNames.gender,
      page: () => SelectGender(),
      binding: GenderBindings(),
    ),
    GetPage(
      name: RouteNames.hurting,
      page: () => WhatsHurting(),
      binding: HurtingBindings(),
    ),
    GetPage(
      name: RouteNames.servey1,
      page: () => SurveScreen1(),
      binding: Servey1Bindings(),
    ),
    GetPage(
      name: RouteNames.servey2,
      page: () => SurveScreen2(),
      binding: Servey2Bindings(),
    ),
    GetPage(
      name: RouteNames.servey3,
      page: () => SurveScreen3(),
      binding: Servey3Bindings(),
    ),
    GetPage(
      name: RouteNames.servey4,
      page: () => SurveScreen4(),
      binding: Servey4Bindings(),
    ),
    GetPage(
      name: RouteNames.home,
      page: () => HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RouteNames.alarm,
      page: () => SelectAlarm(),

    ),
    GetPage(
      name: RouteNames.todaysexercise,
      page: () => TodayScreen(),
      binding: TodayBindings(),
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
