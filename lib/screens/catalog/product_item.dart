import 'package:emelya/constants.dart/app_colors.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 30.h,
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 8),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '12,44 р.',
                style: Theme.of(context).textTheme.headline2,
              ),
              SvgPicture.asset('assets/icons/favorite.svg'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 3,
            ),
            child: Image.asset(
              'assets/images/dummy3.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Text(
            'Семга малосоленая',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: AppOutlinedButton(text: 'В корзину', press: () {}),
              )),
            ],
          )
        ],
      ),
    );
  }
}
