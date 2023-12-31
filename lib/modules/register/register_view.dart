import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/components/custom_button.dart';
import 'package:pharmacy_app/components/custom_textfield.dart';
import 'package:pharmacy_app/modules/register/register_controller.dart';

import '../../components/custom_textfield_password.dart';
import '../../constant.dart';

class Register extends StatelessWidget {
  RegisterController controller = Get.find();

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
                  Image.asset(
                    'assets/images/Asset 18.png',
                    height: 300.h,
                    width: 300.w,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'Enter your Information',
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextField(
                    prefixIcon: Icons.phone,
                    text: 'Phone Number',
                    onchange: (value) {
                      controller.phoneNumber = value;
                    },
                  ),
                  CustomTextField(
                    prefixIcon: Icons.person,
                    text: 'User Name',
                    onchange: (value) {
                      controller.userName = value;
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
                    height: 10.h,
                  ),
                  CustomButton(
                    text: 'Sign in',
                    onpressed: () {
                      onClickRegister();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onClickRegister() async{
    EasyLoading.show(status: 'loading...');
    await controller.clickOnRegister();
    if(controller.registerStatus){
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed('/home');
    }else{
      EasyLoading.showError(
        controller.message,
        dismissOnTap: true,
        duration: Duration(seconds: 60),
      );
    }
  }
}
