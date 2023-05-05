import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/routes/route_names.dart';

class WhatsHurting extends StatelessWidget {
  final WhatsHurtingController controller =
  Get.put(WhatsHurtingController()); //initialize the controller

  List<String> bodypartimages = [    'assets/ex1.jpg',    'assets/ex2.jpg',    'assets/ex3.jpg',    'assets/ex4.jpg',    'assets/ex1.jpg',    'assets/ex2.jpg',    'assets/ex3.jpg',    'assets/ex4.jpg',    'assets/ex1.jpg',  ];
  List<String> bodypartnames = [    'Back',    'Knee',    'Elbow',    'Shoulder',    'Neck',    'Hip',    'Ankle',    'Achilles',    'Foot & sole',  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              'What\'s Hurting?',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Select a body part you can add more',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: bodypartimages.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      controller.setSelectedBodyPart(bodypartnames[index], bodypartimages[index]); //update the selected body part
                      Get.toNamed(RouteNames.servey1,
                          arguments: {'name': bodypartnames[index], 'image': bodypartimages[index]});
                    },
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.08,
                            child: Image.asset(bodypartimages[index])),
                        Obx(() => Text(
                          bodypartnames[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: controller.selectedBodyPart.value ==
                                bodypartnames[index]
                                ? Colors.blue
                                : Colors.black,
                          ),
                        )),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class WhatsHurtingController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String uid = FirebaseAuth.instance.currentUser!.uid;

  var selectedBodyPart = ''.obs;

  Future<void> setSelectedBodyPart(String bodyPartName, String bodyPartImage) async {
    selectedBodyPart.value = bodyPartName;
    await firestore
        .collection('patients')
        .doc(uid)
        .set({'bodypartname': bodyPartName, 'bodypartimage': bodyPartImage}, SetOptions(merge: true));
  }
}