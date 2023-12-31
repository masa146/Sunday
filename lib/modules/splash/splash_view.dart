import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/modules/splash/splash_controller.dart';

import '../../constant.dart';

class Splash extends StatelessWidget {
  SplashController controller=SplashController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: gradientBackground,
          child: Column(
            children: [
              SizedBox(
                height: 230.h,
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
            ],
          ),
        ),
      ),
    );
  }
}
