import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injurydoctor/res/colors.dart';

import 'Widgets/CustomButton.dart';
import 'Widgets/TodayWorkoutListTile.dart';

class TodayScreen extends StatelessWidget {
  final TodayController todayController = Get.put(TodayController());

  TodayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference exercisesRef = FirebaseFirestore.instance.collection('exercise');

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Today\'s Workout',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: exercisesRef.snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading');
                  }

                  final workouts = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

                  return ListView.builder(
                    itemCount: workouts.length,
                    itemBuilder: (context, index) {
                      final workout = workouts[index];
                      return CustomListTile(
                        exercise: workout['exercise'] as String,
                        img: workout['img'] as String,
                        tip: workout['tip'] as String,
                        direction: workout['direction'],
                        muscles: workout['muscles'],
                      );
                    },
                  );
                },
              ),
            ),
            CustomButton(
              title: 'Finish Workout',
              ontap: () {
                todayController.finishWorkout();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TodayController extends GetxController {
  void finishWorkout() {
    // Implement your logic to finish the workout here
  }
}
