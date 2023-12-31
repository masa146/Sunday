
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key,required this.icon,required this.onpressed});
  final IconData icon;
  final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 38.w,
      ),
      child: IconButton(
        onPressed: onpressed,
        icon:Icon(icon),
        color: Colors.blueGrey,
        iconSize: 30.sp,
      ),
    );
  }
}
