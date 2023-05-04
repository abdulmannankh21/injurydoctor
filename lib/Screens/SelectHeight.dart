import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/Screens/Widgets/CustomButton.dart';
import 'package:injurydoctor/res/colors.dart';
import 'package:injurydoctor/routes/route_names.dart';

class SelectHeightController extends GetxController {
  final TextEditingController heightController = TextEditingController();
  var height = 0.0.obs;

  void updateHeight() {
    height.value = double.tryParse(heightController.text) ?? 0;
  }

  Future<void> saveHeight() async {
    if (height.value != 0) {
      try {
        String uid = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance
            .collection('patients')
            .doc(uid)
            .set({'height': height.value}, SetOptions(merge: true));
        Get.offNamed(RouteNames.weight);
      } catch (e) {
        Get.snackbar("Error", "Error saving height");
      }
    }
  }
}

class SelectHeight extends GetView<SelectHeightController> {
  const SelectHeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: ht * 0.1,
                ),
                const Text(
                  'Height',
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
                  child: Center(
                    child: TextField(
                      controller: controller.heightController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => controller.updateHeight(),
                      decoration: InputDecoration(
                        hintText: 'Enter height',
                        suffixIcon:Text("Feet") ,
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
                    ),
                  ),
                ),

                SizedBox(
                    height: ht * 0.12,
                    width: wt * 0.93,
                    child: CustomButton(
                      title: 'Continue',
                      ontap: controller.saveHeight,
                      // Disable the button if the height is not valid

                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
