import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/Screens/Widgets/TodayWorkoutListTile.dart';
import 'package:injurydoctor/res/colors.dart';


import 'Widgets/CustomButton.dart';

class TodayScreen extends StatelessWidget {
  final TodayController todayController = Get.put(TodayController());

  TodayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Obx(() => ListView.builder(
                itemCount: todayController.workouts.length,
                itemBuilder: (context, index) {
                  final workout = todayController.workouts[index];
                  return CustomListTile(workout: workout);
                },
              )),
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
  final workouts = <String>[].obs;

  void addWorkout(String workout) {
    workouts.add(workout);
  }

  void finishWorkout() {
    // Implement your logic to finish the workout here
  }
}
