import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injurydoctor/res/colors.dart';
import 'package:injurydoctor/routes/route_names.dart';

import 'Widgets/CustomButton.dart';
import 'Widgets/TodayWorkoutListTile.dart';

class TodayScreen extends StatelessWidget {
  final TodayController todayController = Get.put(TodayController());

  TodayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference exercisesRef =
    FirebaseFirestore.instance.collection('exercise');

    final String uid = FirebaseAuth.instance.currentUser!.uid;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: FutureBuilder<DocumentSnapshot>(
          future:
          FirebaseFirestore.instance.collection('patients').doc(uid).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            String injury = snapshot.data!['bodypartname'];
            return Column(
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
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Loading');
                      }
                      final workouts = snapshot.data!.docs
                          .map((doc) => doc.data() as Map<String, dynamic>)
                          .toList();
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: workouts.length,
                        itemBuilder: (context, index) {
                          final workout = workouts[index];
                          return injury == workout['injury_name']
                          ? CustomListTile(
                      exercise: workout['exercise_name'] ?? "",
                      img: workout['img_url'] ?? "",
                      tip: workout['tips'] ?? "",
                      direction1: workout['direction1'] ?? "",
                      direction2: workout['direction2'] ?? "",
                      direction3: workout['direction3'] ?? "",
                      muscle: workout['muscle'] ?? "",
                      )
                              :
                          Text("");
                      },
                      );
                    },
                  ),
                ),
                CustomButton(
                  title: 'Finish Workout',
                  ontap: () {
                    todayController.finishWorkout();
                    Get.toNamed(RouteNames.home);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class TodayController extends GetxController {
  void finishWorkout() {

     }
}
