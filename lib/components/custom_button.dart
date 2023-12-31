import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.text,required this.onpressed});
  final String text;
  final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child:Text(
        text,
        style: TextStyle(fontSize: 20.sp),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor:buttonColor,
        fixedSize: Size(200.w, 40.h),
      ),
    );
  }
}
