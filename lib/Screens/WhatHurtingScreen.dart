import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/Screens/Gender.dart';

class WhatsHurting extends StatefulWidget {
  const WhatsHurting({Key? key}) : super(key: key);

  @override
  State<WhatsHurting> createState() => _WhatsHurtingState();
}

class _WhatsHurtingState extends State<WhatsHurting> {
  List images = [
    'assets/ex1.jpg',
    'assets/ex2.jpg',
    'assets/ex3.jpg',
    'assets/ex4.jpg',
    'assets/ex1.jpg',
    'assets/ex2.jpg',
    'assets/ex3.jpg',
    'assets/ex4.jpg',
    'assets/ex1.jpg',
  ];
  List names = [
    'Back',
    'Knee',
    'Elbow',
    'Shoulder',
    'Neck',
    'Hip',
    'Ankle',
    'Back',
    'Knee',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           const SizedBox(height: 60,),
            const Text(
              'What\'s Hurting?',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              'Select a body part you can add more',
              style: TextStyle(
                  fontSize: 18,

              ),
            ),
           const SizedBox(height: 40,),
            Expanded(
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Get.to(GenderScreen());
                    },
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.1,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.08,
                            child: Image.asset(images[index])),
                        Text(
                          names[index],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
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
