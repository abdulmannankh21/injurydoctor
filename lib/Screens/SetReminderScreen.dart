import 'package:flutter/material.dart';

import 'Widgets/CustomButton.dart';

class SetReminder extends StatelessWidget {
  const SetReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Text(
                  'When is the best time to remind you?',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                  height: 100,
                  child: CustomButton(ontap: () {}, title: '18:00')),
              SizedBox(
                height: 100,
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: CustomButton(ontap: () {}, title: 'M')),
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: CustomButton(ontap: () {}, title: 'T')),
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: CustomButton(ontap: () {}, title: 'W')),
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: CustomButton(ontap: () {}, title: 'Th')),
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: CustomButton(ontap: () {}, title: 'F')),
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: CustomButton(ontap: () {}, title: 'St')),
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: CustomButton(ontap: () {}, title: 'S')),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
              ),
              SizedBox(
                  height: 100,
                  child: CustomButton(ontap: () {}, title: 'Set Reminder')),
             const  Text(
                'I will do this later',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
