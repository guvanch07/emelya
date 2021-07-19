import 'package:emelya/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;

  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 17),
      height: isActive ? 13 : 14,
      width: isActive ? 13 : 14,
      decoration: BoxDecoration(
        color: isActive ? AppColors.black : AppColors.purple,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
