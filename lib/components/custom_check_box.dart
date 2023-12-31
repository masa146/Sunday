import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox(
      {required this.size, required this.iconSize, required this.onTap, required this.isSelected});

  final Function() onTap;
  final double? size;
  final double? iconSize;
  late bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: isSelected! ? Colors.blueGrey: Colors.transparent,
          borderRadius: BorderRadius.circular(0.8),
          border: isSelected! ? null : Border.all(
            color: Colors.blueGrey,
            width: 1.5,
          ),
        ),
        width: size,
        height: size,
        child: isSelected! ? Icon(
          Icons.check,
          color: Colors.white,
          size: iconSize,
        ):null,
      ),
    );
  }
}
