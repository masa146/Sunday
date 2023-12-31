import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/constant.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.prefixIcon,
    required this.text,
    required this.onchange,
  });

  final String text;
  final IconData prefixIcon;
  final Function(String) onchange;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: TextField(
        onChanged: onchange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 22.h),
          hintText: text,
          hintStyle: TextStyle(fontSize: 20.sp),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Icon(
              prefixIcon,
              size: 30.w.h,
            ),
          ),
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: firstBackColor,
            ),
          ),
        ),
      ),
    );
  }
}
