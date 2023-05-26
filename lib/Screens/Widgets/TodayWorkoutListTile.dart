import 'package:flutter/material.dart';

import '../../res/colors.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({
    super.key,
    required this.exercise,
    required this.img,
    required this.tip,
    required this.direction1,
    required this.direction2,
    required this.direction3,
    required this.muscle,
  });

  final String exercise;
  final String img;
  final String tip;
  final String direction1;
  final String direction2;
  final String direction3;
  final String muscle;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: AppColors.textfieldcolor,
      iconColor: AppColors.textfieldcolor,
      title: Text(
        exercise,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Image.asset(img)),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Directions",style: TextStyle(
                    fontWeight: FontWeight.w900
                  ),
                  ),
                  Text(
                    direction1,
                    maxLines: 4,

                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                direction2,
                maxLines: 4,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                direction3,
                maxLines: 4,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tips",style: TextStyle(
                      fontWeight: FontWeight.w900
                  ),),
                  Text(
                    tip,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Muscle",style: TextStyle(
                      fontWeight: FontWeight.w900
                  ),),
                  Text(
                    muscle,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
