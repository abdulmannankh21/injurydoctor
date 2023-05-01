import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/routes/route_names.dart';

class WhatsHurting extends StatelessWidget {
  final WhatsHurtingController controller =
  Get.put(WhatsHurtingController()); //initialize the controller

  List<String> images = [    'assets/ex1.jpg',    'assets/ex2.jpg',    'assets/ex3.jpg',    'assets/ex4.jpg',    'assets/ex1.jpg',    'assets/ex2.jpg',    'assets/ex3.jpg',    'assets/ex4.jpg',    'assets/ex1.jpg',  ];
  List<String> names = [    'Back',    'Knee',    'Elbow',    'Shoulder',    'Neck',    'Hip',    'Ankle',    'Back',    'Knee',  ];

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
                itemCount: images.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      controller.setSelectedBodyPart(names[index]); //update the selected body part
                      Get.toNamed(RouteNames.servey1,
                          arguments: {'name': names[index], 'image': images[index]});
                    },
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.08,
                            child: Image.asset(images[index])),
                        Obx(() => Text(
                          names[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: controller.selectedBodyPart.value ==
                                names[index]
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
  var selectedBodyPart = ''.obs;

  void setSelectedBodyPart(String bodyPart) {
    selectedBodyPart.value = bodyPart;
  }
}