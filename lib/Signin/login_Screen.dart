import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/colors.dart';
import '../res/spacer.dart';
import 'login_Controller.dart';

class LoginScreen extends StatelessWidget {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) => Scaffold(
              backgroundColor: AppColors.bgColor,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: Get.height * 0.06,
                          ),
                          Image.asset(
                            'assets/logo.png',
                            width: 150,
                          ),
                          SizedBox(
                            height: Get.height * 0.1,
                          ),
                          Row(
                            children: [
                              Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          Container(
                            height: verticalValue(50),
                            decoration: BoxDecoration(
                              color:
                                  AppColors.textfieldcolor.withOpacity(0.2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                            ),
                            child: Center(
                              child: TextField(
                                onChanged: _.setEmail,
                                decoration: InputDecoration(
                                  hintText: 'Enter email',
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:Icon(Icons.person),
                                  ),
                                  prefixIconConstraints: BoxConstraints(maxHeight: 40,maxWidth: 40),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 16),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          Container(
                            height: verticalValue(50),
                            decoration: BoxDecoration(
                              color:
                                  AppColors.textfieldcolor.withOpacity(0.2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                            ),
                            child: Center(
                              child: TextField(
                                obscureText: true,
                                onChanged: _.setPassword,
                                decoration: InputDecoration(
                                    hintText: '  Enter Password  ',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.lock),
                                    ),
                                    prefixIconConstraints: BoxConstraints(maxHeight: 40,maxWidth: 40),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 16),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [GestureDetector(
                              onTap: () {
                                Get.toNamed('/signup');
                              },
                                child: const Text(
                                  "Dont have account?",
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w800),
                                ))],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          GestureDetector(
                            onTap: _.login,
                            child: Container(
                                height: verticalValue(50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Color(0xFF325da2),
                                ),
                                child: const Center(
                                    child: Text(
                                  'Sign In',
                                  style:
                                      TextStyle(color: AppColors.bgColor),
                                ))),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
