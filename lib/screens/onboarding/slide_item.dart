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
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          width: 25.w,
          height: 1.5,
          decoration: const BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            slideList[index].description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
