import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/components/custom_button.dart';
import 'package:pharmacy_app/components/custom_check_box.dart';
import 'package:pharmacy_app/components/custom_textfield.dart';
import 'package:pharmacy_app/components/custom_textfield_password.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/modules/login/login_controller.dart';

class Login extends StatelessWidget {
  LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: gradientBackground,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Image.asset(
                    'assets/images/Herbal_medicine_with_leaf_logo_12_-removebg-preview.png',
                    height: 150.h,
                    width: 150.w,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'Pharmacy',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF5271FF),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() {
                          return CustomCheckBox(
                            size: 25,
                            iconSize: 20,
                            isSelected: controller.checkBoxStatus.value,
                            onTap: () {
                              controller.changeCheckBox();
                            },
                          );
                        }),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          'Keep me login',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    prefixIcon: Icons.person,
                    text: 'Phone Number',
                    onchange: (value) {
                      controller.phoneNumber = value;
                    },
                  ),
                  Obx((){
                   return CustomTextFieldPassword(
                      prefixIcon: Icons.lock,
                      isSelected: controller.checkPasswordStatus.value,
                      onpressed: () {
                        controller.changeCheckPassword();
                      },
                      text: 'Password',
                      onchange: (value) {
                        controller.password = value;
                      },
                    );
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    text: 'Login',
                    onpressed: () {
                      onClickLogin();
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have account? ',
                        style:
                            TextStyle(fontSize: 20.sp, color: Colors.blueGrey),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/register');
                        },
                        child: Text(
                          'Create Account',
                          style: TextStyle(fontSize: 20.sp, color: buttonColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onClickLogin() async {
    EasyLoading.show(status: 'loading...');
    await controller.loginOnClick();
    if (controller.loginStatus) {
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed('/home');
    } else {
      EasyLoading.showError(
        controller.message,
        dismissOnTap: true,
        duration: const Duration(seconds: 60),
      );
    }
  }
}
