import 'package:emelya/constants.dart/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './slide.dart';

class SlideItem extends StatelessWidget {
  final int index;

  const SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: SvgPicture.asset(
            slideList[index].image,
          ),
        ),
        Text(
          slideList[index].title,
          style: const TextStyle(
              fontSize: 24,
              color: AppColors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            slideList[index].description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                fontFamily: 'Roboto'),
          ),
        ),
      ],
    );
  }
}
