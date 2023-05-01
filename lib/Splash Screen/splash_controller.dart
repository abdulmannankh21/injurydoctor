import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/Screens/NavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../res/res.dart';
import '../routes/route_names.dart';
import '../routes/routes.dart';
import 'export.dart';

class SplashPresenterImpl extends SplashController with StateMixin<SplashScreen> {
  bool isInitialized = false;

  @override
  void initialize(BuildContext context) async {
    initAppResources(context);
    getCurrentUser();

  }
  User? getCurrentUser() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.off(MyNavBar());
      return user;
    } else {
      navigateToLoginAfterDelay();
      return null;
    }
  }
  void initAppResources(BuildContext context) {
    if (isInitialized) {
      return;
    }
    isInitialized = true;
    initializeResources(context: context);
  }
@override
  void navigateToLoginAfterDelay() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed(RouteNames.login);
  }
  @override
  void openNextRoute(String routeName) {
    // Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  void navigateToOnBoarding() {
    // TODO: implement navigateToOnBoarding
  }

}
