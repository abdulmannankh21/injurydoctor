import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../routes/route_names.dart';
import '../routes/routes.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;

  void login() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      Get.snackbar("Error", "Please enter your email and password");
      Get.toNamed(RouteNames.age);
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.value,
          password: password.value,
        );
        // if (userCredential.user != null) {
        //   AppRoutes.appRoutes(RouteNames.navigation);
        // } else {
        //   Get.snackbar("Error", "Invalid credentials");
        // }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar("Error", "User not found for provided email address");
        } else if (e.code == 'wrong-password') {
          Get.snackbar("Error", "Invalid password");
        } else {
          Get.snackbar("Error", "Error signing in");
        }
      } catch (e) {
        Get.snackbar("Error", "Error signing in");
      }
    }
  }

  void setPassword(String value) {
    password.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }
}
