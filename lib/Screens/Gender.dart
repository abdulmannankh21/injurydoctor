import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/routes/route_names.dart';

class SelectGender extends StatelessWidget {
  final GenderController genderController = Get.put(GenderController());

  SelectGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: ht * 0.15,
              ),
              const Text(
                'Gender',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: ht * 0.09,
                width: wt * 0.8,
                child: Custombtn(
                  title: 'Male',
                  ontap: () {
                    genderController.selectGender('male');
                    genderController.saveGender();
                  },
                  icon: const Icon(
                    Icons.male,
                  ),
                ),
              ),
              SizedBox(
                height: ht * 0.09,
                width: wt * 0.8,
                child: Custombtn(
                  title: 'Female',
                  ontap: () {
                    genderController.selectGender('female');
                    genderController.saveGender();
                  },
                  icon: const Icon(
                    Icons.female,
                  ),
                ),
              ),
              SizedBox(
                height: ht * 0.09,
                width: wt * 0.8,
                child: Custombtn(
                  title: 'Other',
                  ontap: () {
                    genderController.selectGender('other');
                    genderController.saveGender();
                  },
                  icon: const Icon(
                    Icons.transgender,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderController extends GetxController {
  var selectedGender = 'male'.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  void saveGender() async {
    if (selectedGender.value.toString() != " ") {
      try {
        String uid = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance
            .collection('patients')
            .doc(uid)
            .set({'gender': selectedGender.value.toString()}, SetOptions(merge: true));
        Get.offNamed(RouteNames.hurting);
      } catch (e) {
        Get.snackbar("Error", "Error saving weight");
      }
    }
  }
}

class Custombtn extends StatelessWidget {
  final String title;
  var ontap;
  var icon;

  Custombtn({Key? key, required this.title, this.icon, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
