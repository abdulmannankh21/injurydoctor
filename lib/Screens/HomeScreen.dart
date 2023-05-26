import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/res/colors.dart';
import 'Widgets/CustomButton.dart';
import 'Widgets/HomeScreen Widgets/MainText.dart';
import 'Widgets/HomeScreen Widgets/ProgressBar_BackPain.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('patients').doc(uid).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          String name = snapshot.data!['name']; // retrieve the name field from the snapshot data
          String bodypartname = snapshot.data!['bodypartname']; // retrieve the name field from the snapshot data
          String bodypartimage = snapshot.data!['bodypartimage']; // retrieve the name field from the snapshot data
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: ht * 0.5,
                  width: wt * 1,
                  color: AppColors.primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainText(
                              name: ' Hi ' + name +' ! ',
                            ),
                            SizedBox(height: ht * 0.01),
                            const Text(
                              'Designed by specialist doctors for optimal treatment and pain reduction',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.bgColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: ht * 0.04),
                ExpansionTile(
                  collapsedIconColor: AppColors.textfieldcolor,
                  iconColor: AppColors.textfieldcolor,
                  title: Text(
                    'Pain in your ' + bodypartname,
                    style: TextStyle(
                        color: AppColors.textfieldcolor, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          title: Text('Add pain point $index'),
                          value: index,
                          groupValue: _controller.selectedPainIndex.value,
                          onChanged: (value) {
                            _controller.setSelectedPainIndex(value!);
                          },
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: ht * 0.04),

                ProgressBar_BackPain_Container(wt: wt, ht: ht,image: bodypartimage,injuryname: bodypartname),
              ],
            ),
          );
        },
      ),
    );
  }
}



class HomeController extends GetxController {

  var selectedPainIndex = 0.obs;

  void setSelectedPainIndex(int index) {
    selectedPainIndex.value = index;
  }
}