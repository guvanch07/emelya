import 'package:emelya/constants.dart/app_colors.dart';
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
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              slideList[index].title,
              style: const TextStyle(
                  fontSize: 24,
                  color: AppColors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            )),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 120),
          child: SvgPicture.asset("assets/icons/logo.svg"),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            slideList[index].description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
                fontFamily: 'Roboto'),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: SvgPicture.asset(
            slideList[index].image,
          ),
        )
      ],
    );
  }
}
