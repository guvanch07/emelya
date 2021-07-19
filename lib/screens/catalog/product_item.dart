import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emelya/core/utils/double.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.price,
    required this.isFavorite,
    required this.imageUri,
    required this.name,
  }) : super(key: key);

  final double price;
  final bool isFavorite;
  final String imageUri;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
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
                  price.toPrice(),
                  style: Theme.of(context).textTheme.headline2,
                ),
                GestureDetector(
                    onTap: () => {
                          //TODO: add to favorite logic
                        },
                    child: SvgPicture.asset('assets/icons/favorite.svg')),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Image.asset(
                  imageUri,
                ),
              ),
            ),
            Text(
              name,
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
      ),
    );
  }
}
