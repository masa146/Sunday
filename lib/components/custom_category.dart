import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/constant.dart';
import 'package:pharmacy_app/models/category.dart';

class CustomCategory extends StatelessWidget {
  CustomCategory({super.key, required this.category,required this.onPressed});
  Category category;
  Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return
       Padding(
        padding: EdgeInsets.all( 8.sp),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor
          ),
          onPressed: onPressed,
          child: Column(

              children: [
                Image.network(
                  category.cataegoryImage,
                  height: 80.h,
                  width: 140.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width:5.w ,
                  height: 5.h,
                ),
                Text(category.categoryName,style: TextStyle(fontSize: 16.sp),),
              ],
            ),
          ),


    );
  }
}
