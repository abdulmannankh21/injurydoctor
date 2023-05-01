import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/res/colors.dart';
import '../Widgets/CustomButton.dart';
import 'SurveScreen4.dart';

class SurveScreen3 extends StatelessWidget {
  const SurveScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SurveScreen3Controller _controller = Get.put(SurveScreen3Controller());
    final arguments = Get.arguments as Map<String, dynamic>;
    final name = arguments['name'] as String;
    final image = arguments['image'] as String;
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: ht * 0.05,
              ),
              SizedBox(
                height: ht * 0.1,
                width: wt * 0.2,
                child: Image.asset(image),
              ),
               Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textfieldcolor,
                ),
              ),
              SizedBox(
                height: ht * 0.06,
              ),
              const Text(
                'How painful is it when the pain is at\nits worst?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textfieldcolor,
                ),
              ),
              SizedBox(
                height: ht * 0.01,
              ),
              const Text(
                'Your answer will be the starting point for tracking your pain\nand how it develops in the future.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: AppColors.textfieldcolor,
                ),
              ),
              SizedBox(
                height: ht * 0.4,
              ),
              Obx(() => Slider(
                value: _controller.painLevel.value,
                onChanged: (double value) {
                  _controller.painLevel.value = value;
                },
                divisions: 100,
                max: 100,
                label: _controller.painLevel.value.round().toString(),
                activeColor: AppColors.primaryColor,
                inactiveColor: AppColors.textfieldcolor,
              )),
              SizedBox(
                height: ht * 0.12,
                child: CustomButton(
                  title: 'Save',
                  ontap: () {
                    _controller.savePainLevel();
                    Get.to(() => SurveScreen4(), arguments: arguments);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class SurveScreen3Controller extends GetxController {
  var painLevel = 20.0.obs;

  void savePainLevel() async {
     // Get the patient ID here.
    final painLevelValue = painLevel.value.toInt();

    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection('patients')
          .doc(uid)
          .set({'painLevel': painLevelValue},SetOptions(merge: true));
      print('Pain level saved successfully!');
    } catch (e) {
      print('Error saving pain level: $e');
    }
  }
}
