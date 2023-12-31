import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class CustomTextFieldPassword extends StatelessWidget {
   CustomTextFieldPassword({
    super.key,
    required this.prefixIcon,
    required this.text,
    required this.onchange,
    required this.isSelected,
    required this.onpressed,
  });

  final String text;
  final IconData prefixIcon;
  late bool isSelected;
  final Function(String) onchange;
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: TextField(
        obscureText:!isSelected,
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
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: isSelected!
                ? IconButton(
              onPressed: onpressed,
              icon: Icon(Icons.visibility),
              iconSize: 30.w.h,
            )
                : IconButton(
              icon: Icon(Icons.visibility_off),
              onPressed: onpressed,
              iconSize: 30.w.h,
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
