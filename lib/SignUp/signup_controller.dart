import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../routes/route_names.dart';
import '../routes/routes.dart';

class SignupController extends GetxController {
  final name = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final auth = FirebaseAuth.instance;

  void signUp() async {
    if (name.value.isEmpty || email.value.isEmpty || password.value.isEmpty) {
      Get.snackbar("Error", "Please enter your name, email, and password");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email.value,
          password: password.value,
        );
        if (userCredential.user != null) {
          String uid = userCredential.user!.uid;
          await FirebaseFirestore.instance.collection('patients')
              .doc(uid)
              .set({
            'name': name.value,
            'email': email.value,
            'password': password.value,
            'patientid': uid,
          });
          Get.toNamed(RouteNames.login);
        } else {
          Get.snackbar("Error", "Error creating account");
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          Get.snackbar("Error", "Email address is already in use");
        } else {
          Get.snackbar("Error", "Error creating account");
        }
      } catch (e) {
        Get.snackbar("Error", "Error creating account");
      }
    }
  }

  void setName(String value) {
    name.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

}