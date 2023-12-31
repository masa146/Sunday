import 'package:flutter/cupertino.dart';

const Color firstBackColor = Color(0xFF95BAFF);
const Color secondBackColor = Color(0xFFFFFFFF);
const Color buttonColor= Color(0xFF95BAFF);
const Color appBarColor= Color(0xFF61BCAB);
const BoxDecoration gradientBackground = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      firstBackColor,
      secondBackColor,
    ],
  ),
);
