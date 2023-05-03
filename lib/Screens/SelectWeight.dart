import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/Screens/SelectAge.dart';
import 'package:injurydoctor/Screens/Widgets/CustomButton.dart';
import 'package:injurydoctor/res/colors.dart';
import 'package:injurydoctor/routes/route_names.dart';

class SelectWeight extends StatelessWidget {
  final SelectWeightController controller =
  Get.put(SelectWeightController());

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
                height: ht * 0.1,
              ),
              const Text(
                'Weight',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textfieldcolor),
              ),
              SizedBox(
                height: ht * 0.02,
              ),
              SizedBox(
                height: ht * 0.05,
                width: wt * 0.8,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Weight',
                    suffixIcon:Text("Kg") ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: AppColors.textfieldcolor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: AppColors.textfieldcolor,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    controller.updateWeight(value);
                  },
                ),
              ),

              SizedBox(
                  height: ht * 0.12,
                  width: wt * 0.93,
                  child: CustomButton(
                    title: 'Continue',
                    ontap: controller.saveWeight,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectWeightController extends GetxController {
  var weight = ''.obs;

  void updateWeight(String value) {
    weight.value = value;
  }
  void saveWeight() async {
    if (weight.value != 0) {
      try {
        String uid = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance
            .collection('patients')
            .doc(uid)
            .set({'weight': weight.value}, SetOptions(merge: true));
        Get.offNamed(RouteNames.height);
      } catch (e) {
        Get.snackbar("Error", "Error saving weight");
      }
    }
  }
}
